  
  
import java.io.File;  
  
import org.apache.lucene.document.Document;  
import org.apache.lucene.index.DirectoryReader;  
import org.apache.lucene.index.IndexReader;  
import org.apache.lucene.index.Term;  
import org.apache.lucene.search.IndexSearcher;  
import org.apache.lucene.search.ScoreDoc;  
import org.apache.lucene.search.TermQuery;  
import org.apache.lucene.search.TopDocs;  
import org.apache.lucene.store.Directory;  
import org.apache.lucene.store.FSDirectory;  
import org.junit.Test;  
  
public class IndexSearch {  
  
    /** 
     * 查询 
     * @throws Exception 
     */  
    @Test  
    public void search() throws Exception {  
        String filePath="D://lucene/index4";  
        Directory dir=FSDirectory.open(new File(filePath));  
        IndexReader reader=DirectoryReader.open(dir);  
        IndexSearcher searcher=new IndexSearcher(reader);  
        
        Term term=new Term("name", "css");  
        TermQuery query=new TermQuery(term);  
        TopDocs topdocs=searcher.search(query, null,1000);  
        
        ScoreDoc[] scoreDocs=topdocs.scoreDocs;  
        System.out.println("查询结果总数---" + topdocs.totalHits+"最大的评分--"+topdocs.getMaxScore());  
        for(int i=0; i < scoreDocs.length; i++) {  
            int doc = scoreDocs[i].doc;  
            Document document = searcher.doc(doc);  
            System.out.println("content===="+document.get("name"));  
            System.out.println("id--" + scoreDocs[i].doc + "---scors--" + scoreDocs[i].score+"---index--"+scoreDocs[i].shardIndex);  
        }  
        reader.close();  
    }  
}  