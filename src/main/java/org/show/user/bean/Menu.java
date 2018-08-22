package org.show.user.bean;

import java.util.List;
import java.util.Map;

/**
 * easyui，tree
 * 对用字段名称
 */
public class Menu {
    // 菜单id
    private String id;
    // 菜单名称
    private String text;
    // 父菜单id
    private String parentId;
    // 菜单url
    private String url;
    // 菜单图标
    private String icon;
    // 菜单顺序
    private int order;
    //菜单层级
    private String level ;
    //节点是否打开“open/closed”
    private String state ;
    //
    private Map<String,Object> attribute ;
    // 子菜单
    private List<Menu> children;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Map<String, Object> getAttribute() {
        return attribute;
    }

    public void setAttribute(Map<String, Object> attribute) {
        this.attribute = attribute;
    }

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }
}