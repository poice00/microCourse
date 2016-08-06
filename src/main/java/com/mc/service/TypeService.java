package com.mc.service;

import com.mc.base.DaoSupport;
import com.mc.domain.Type;

public interface TypeService extends DaoSupport<Type> {
	/**
	 * @desc 根据名称获取ID
	 * @param name 名字
	 * @return long
	 * @author yanbaobin@yeah.net
	 * @date Sep 22, 2015 9:51:31 AM
	 */
	Type getByName(String name);
}
