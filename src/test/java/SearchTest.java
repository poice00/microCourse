import java.io.File;
import java.io.IOException;
import java.io.StringReader;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.FuzzyQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.search.highlight.Formatter;
import org.apache.lucene.search.highlight.Fragmenter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.Scorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.junit.Test;
import org.wltea.analyzer.lucene.IKAnalyzer;

public class SearchTest {
	
	
	
	
	@Test
	public void testHightlight() throws IOException, InvalidTokenOffsetsException, ParseException{
		String indexPath = "F:\\eclipse_workspace_J2EE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\microCourse\\course"; //根目录
		System.out.println(indexPath);
		//Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_4_9);
		
		//实例化IKAnalyzer分词器 
		Analyzer analyzer = new IKAnalyzer();
		IndexReader indexReader = DirectoryReader.open(FSDirectory.open(new File(indexPath)));
		IndexSearcher searcher = new IndexSearcher(indexReader);
		
		
		//Query nameQuery = new TermQuery(name);
		//FuzzyQuery用来搜索相似的term，使用Levenshtein算法。
		String queryString = "游戏";
		QueryParser nameParser = new QueryParser(Version.LUCENE_4_9, "name", analyzer);
		nameParser.setDefaultOperator(QueryParser.AND_OPERATOR);  
		Query nameQuery = nameParser.parse(queryString);
		
		QueryParser descriptionParser = new QueryParser(Version.LUCENE_4_9, "description", analyzer);
		descriptionParser.setDefaultOperator(QueryParser.AND_OPERATOR);  
		Query descriptionQuery = descriptionParser.parse(queryString);
		
		
//		Term name = new Term("name",queryString);
//		Query nameQuery = new FuzzyQuery(name);
		
//		Term description = new Term("description",queryString);
//		Query descriptionQuery = new FuzzyQuery(description);
		
		//搜索相似度最高的5条记录
		TopDocs topNameDocs =  searcher.search(nameQuery,100);
		TopDocs topDecDocs =  searcher.search(descriptionQuery, null,1000);
		
		System.out.println("找到【"+topNameDocs.totalHits+"】个：");
		System.out.println("找到【"+topDecDocs.totalHits+"】个：");
		
		for (int i = 0; i < topNameDocs.scoreDocs.length; i++) {
			int docId = topNameDocs.scoreDocs[i].doc;
			Document document = searcher.doc(docId);
			
			String courseId = document.get("courseId");
			String nameResult = document.get("name");
			System.out.println("课程名："+courseId+ "|" +nameResult);
		}
		for (int i = 0; i < topDecDocs.scoreDocs.length; i++) {
			int docId = topDecDocs.scoreDocs[i].doc;
			Document document = searcher.doc(docId);
			String courseId = document.get("courseId");
			String documentResult = document.get("description");
			System.out.println("课程描述："+courseId+"|"+documentResult);
		}
		// 分页，高亮显示
		higherIndex(analyzer, searcher, nameQuery, topNameDocs);
		     
	}

		/**
	  * 分页，高亮显示
	  * 
	  * @param analyzer
	  * @param isearcher
	  * @param query
	  * @param topDocs
	  * @throws IOException
	  * @throws InvalidTokenOffsetsException
	  */
	 public void higherIndex(Analyzer analyzer, IndexSearcher isearcher, Query query, TopDocs topDocs)
	         throws IOException, InvalidTokenOffsetsException {
	     TopScoreDocCollector results = TopScoreDocCollector.create(topDocs.totalHits, false);
	     isearcher.search(query, results);
	     // 分页取出指定的doc(开始条数, 取几条)
	     ScoreDoc[] docs = results.topDocs(0, 2).scoreDocs;
	     // 关键字高亮显示的html标签，需要导入lucene-highlighter-3.5.0.jar
	     SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter("<font color='red'>", "</font>");
	     Highlighter highlighter = new Highlighter(simpleHTMLFormatter, new QueryScorer(query));
	     for (int i = 0; i < docs.length; i++) {
	         Document doc = isearcher.doc(docs[i].doc);
	         // 标题增加高亮显示
	         TokenStream tokenStream1 = analyzer.tokenStream("name", new StringReader(doc.get("name")));
	         String title = highlighter.getBestFragment(tokenStream1, doc.get("name"));
	         // 内容增加高亮显示
	         TokenStream tokenStream2 = analyzer.tokenStream("description", new StringReader(doc.get("description")));
	         String content = highlighter.getBestFragment(tokenStream2, doc.get("description"));
	         System.out.println(doc.get("courseId") + " : " + title + " : " + content);
	     }
	 }

}
