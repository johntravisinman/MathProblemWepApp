package edu.umsl.java.beans;

public class Problem {
	private int mpid;
	private String content;
	private int cat_mapping;
	
	public int getMpid() {
		return mpid;
	}
	public void setMpid(int mpid) {
		this.mpid = mpid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCat_mapping() {
		return cat_mapping;
	}
	public void setCat_mapping(int cat_mapping) {
		this.cat_mapping = cat_mapping;
	}
}
