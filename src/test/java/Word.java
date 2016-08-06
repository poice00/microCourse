import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hankcs.hanlp.HanLP;
import com.hankcs.hanlp.dictionary.CoreSynonymDictionary;
import com.hankcs.hanlp.dictionary.py.Pinyin;

public class Word {

	@Test
	public void name() throws Exception {

		/*
		 * String document =
		 * "算法可大致分为基本算法、数据结构的算法、数论算法、计算几何的算法、图的算法、动态规划以及数值分析、加密算法、排序算法、检索算法、随机化算法、并行算法、厄米变形模型、随机森林算法。\n"
		 * + "算法可以宽泛的分为三类，\n" +
		 * "一，有限的确定性算法，这类算法在有限的一段时间内终止。他们可能要花很长时间来执行指定的任务，但仍将在一定的时间内终止。这类算法得出的结果常取决于输入值。\n"
		 * + "二，有限的非确定算法，这类算法在有限的时间内终止。然而，对于一个（或一些）给定的数值，算法的结果并不是唯一的或确定的。\n" +
		 * "三，无限的算法，是那些由于没有定义终止定义条件，或定义的条件无法由输入的数据满足而不终止运行的算法。通常，无限算法的产生是由于未能确定的定义终止条件。";
		 * List<String> sentenceList = HanLP.extractSummary(document, 3);
		 * System.out.println(sentenceList);
		 */
		String str="";
		String text ="这个和还是有差距的,开篇的无限循环GIF,我的双眼,两个字：精彩！这个代码都能过，你们这个检测有问题！非要用上海北京 缩成S和B么。。哈哈哈。在android手机上总是出事！举报！索引运算符讲解部分木有画面！！！9分12秒之后！这老师是神级的。很赞。学完了，小功告成！开始学习新课程，哈哈！ames_yuan 讲的很好！";
		List<String> sentenceListAll = spiltSentence(text);
		System.out.println(sentenceListAll);
		int limitLength=3;
		/*if (sentenceListAll.size()<=3) {
			limitLength=3;
		} else {
			limitLength=(int) Math.floor(((double)sentenceListAll.size())/10);
		}	*/
		List<String> sentenceList = HanLP.extractSummary(text, 3);
		System.out.println(sentenceList);
		List<String> sentenceListLast = new ArrayList<String>();
		//排序，按原文的顺序输出
		for (int i = 0; i < sentenceListAll.size(); i++) {
			for (int j = 0; j < sentenceList.size(); j++) {
				System.out.println(sentenceList.get(j));
				if (sentenceList.get(j).equals(sentenceListAll.get(i))&&sentenceListLast.size()<=(limitLength-1)) {
					sentenceListLast.add(sentenceList.get(j));
					str+=sentenceList.get(j);
				}
			}	
		}
		System.out.println(str);
	}
	 static List<String> spiltSentence(String document)
	    {
	        List<String> sentences = new ArrayList<String>();
	        for (String line : document.split("[\r\n]"))
	        {
	            line = line.trim();
	            if (line.length() == 0) continue;
	            for (String sent : line.split("[，,。:：“”？?！!；;]"))
	            {
	                sent = sent.trim();
	                if (sent.length() == 0) continue;
	                sentences.add(sent);
	            }
	        }
	        return sentences;
	    }
	 @Test
	 public void distance()
	 {
		 String[] wordArray = new String[]
	             {
	                     "香蕉",
	                     "苹果",
	                     "白菜",
	                     "水果",
	                     "蔬菜",
	                     "自行车",
	                     "公交车",
	                     "飞机",
	                     "买",
	                     "卖",
	                     "购入",
	                     "新年",
	                     "春节",
	                     "丢失",
	                     "补办",
	                     "办理",
	                     "送给",
	                     "寻找",
	                     "孩子",
	                     "教室",
	                     "教师",
	                     "会计",
	             };
	     for (String a : wordArray)
	     {
	         for (String b : wordArray)
	         {
	             System.out.println(a + "\t" + b + "\t之间的距离是\t" + CoreSynonymDictionary.distance(a, b));
	         }
	     }
	 }
	 @Test
	 public void pinyin()
	    {
	        String text = "重载不是重任";
	        List<Pinyin> pinyinList = HanLP.convertToPinyinList(text);
	        System.out.print("原文,");
	        for (char c : text.toCharArray())
	        {
	            System.out.printf("%c,", c);
	        }
	        System.out.println();

	        System.out.print("拼音（数字音调）,");
	        for (Pinyin pinyin : pinyinList)
	        {
	            System.out.printf("%s,", pinyin);
	        }
	        System.out.println();

	        System.out.print("拼音（符号音调）,");
	        for (Pinyin pinyin : pinyinList)
	        {
	            System.out.printf("%s,", pinyin.getPinyinWithToneMark());
	        }
	        System.out.println();

	        System.out.print("拼音（无音调）,");
	        for (Pinyin pinyin : pinyinList)
	        {
	            System.out.printf("%s,", pinyin.getPinyinWithoutTone());
	        }
	        System.out.println();

	        System.out.print("声调,");
	        for (Pinyin pinyin : pinyinList)
	        {
	            System.out.printf("%s,", pinyin.getTone());
	        }
	        System.out.println();

	        System.out.print("声母,");
	        for (Pinyin pinyin : pinyinList)
	        {
	            System.out.printf("%s,", pinyin.getShengmu());
	        }
	        System.out.println();

	        System.out.print("韵母,");
	        for (Pinyin pinyin : pinyinList)
	        {
	            System.out.printf("%s,", pinyin.getYunmu());
	        }
	        System.out.println();

	        System.out.print("输入法头,");
	        for (Pinyin pinyin : pinyinList)
	        {
	            System.out.printf("%s,", pinyin.getHead());
	        }
	        System.out.println();
	    }
}
