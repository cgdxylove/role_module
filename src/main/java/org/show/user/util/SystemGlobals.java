package org.show.user.util;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class SystemGlobals extends PropertyPlaceholderConfigurer {

	private static Map<String, String> propertiesMap;

	/**
	 * 取得properties中的属性
	 * 
	 * @param name
	 * @return
	 */
	public static String getProperty(String name) {

		return propertiesMap.get(name);

	}

	/**
	 * 替换properties中变�?
	 * 
	 * @param key
	 * @param map
	 * @return
	 */
	public static String getProperty(String key, Map<String, String> map) {
		String rstr = propertiesMap.get(key);
		for (Map.Entry<String, String> entry : map.entrySet()) {
			rstr = rstr.replace((String)entry.getKey(), (String)entry.getValue());
		}
		return rstr;
	}

	@Override
	protected void processProperties(ConfigurableListableBeanFactory beanFactory, Properties props)
			throws BeansException {

		super.processProperties(beanFactory, props);
		propertiesMap = new HashMap<String, String>();
		String s;
		for (Object key : props.keySet()) {

			String keyStr = key.toString();
			try {
				s = new String(props.getProperty(keyStr).getBytes("ISO8859-1"), "UTF-8");
				propertiesMap.put(keyStr, s);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
	}

}
