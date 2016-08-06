package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.Chapter;
import com.mc.domain.Course;
import com.mc.domain.Note;
import com.mc.domain.Orientation;
import com.mc.domain.Section;

public interface NoteService extends DaoSupport<Note> {

	List<Note> findBySection(Section section);


}
