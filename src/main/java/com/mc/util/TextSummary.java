package com.mc.util;

import java.util.ArrayList;
import java.util.List;

import com.hankcs.hanlp.HanLP;
import com.hankcs.hanlp.seg.Segment;
import com.hankcs.hanlp.seg.common.Term;

public class TextSummary {

	public static void main(String[] args) throws Exception  {
		String str="";
		String text ="这个和还是有差距的,开篇的无限循环GIF,我的双眼,两个字：精彩！这个代码都能过，你们这个检测有问题！非要用上海北京 缩成S和B么。。哈哈哈。在android手机上总是出事！举报！索引运算符讲解部分木有画面！！！9分12秒之后！这老师是神级的。很赞。学完了，小功告成！开始学习新课程，哈哈！ames_yuan 讲的很好！";
		List<String> sentenceListAll = spiltSentence(text);
		List<Term> words=HanLP.segment(text);
		for (Term term:words) {
			System.out.println(term.word);
		}
		/*int limitLength=3;
		if (sentenceListAll.size()<=3) {
			limitLength=3;
		} else {
			limitLength=(int) Math.floor(((double)sentenceListAll.size())/10);
		}	
		List<String> sentenceList = HanLP.extractSummary(text, limitLength);
		System.out.println(sentenceList);
		List<String> sentenceListLast = new ArrayList<String>();
		//排序，按原文的顺序输出
			for (int j = 0; j < sentenceList.size(); j++) {
			 str+=sentenceList.get(j);
			}	
		System.out.println(str);
		return str;*/
	}
	static List<String> spiltSentence(String document)
    {
        List<String> sentences = new ArrayList<String>();
        for (String line : document.split("[\r\n]"))
        {
            line = line.trim();
            if (line.length() == 0) continue;
            for (String sent : line.split("[，,。:：“”？?！!；;]..."))
            {
                sent = sent.trim();
                if (sent.length() == 0) continue;
                sentences.add(sent);
            }
        }
        return sentences;
    }
}
