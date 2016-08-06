package com.mc.service;


import com.mc.base.DaoSupport;
import com.mc.domain.Orientation;

public interface OrientationService extends DaoSupport<Orientation> {

	Long findByName(String classifyName);

	
}
