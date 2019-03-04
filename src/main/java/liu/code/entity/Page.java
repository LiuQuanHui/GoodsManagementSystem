package liu.code.entity;

import java.util.List;

public class Page<T> {
	private int pageSize;//每页显示多少记录
	private int currentPage;//当前第几页
	private int totalRecord;//一共多少条记录
	private int totalPage;//一共多少页记录
	private List<T> dataList;//数据集合
	
	public Page() {
		super();
	}
	public Page(int pageSize,int pageNum,List<T> sourList) {
		if(sourList==null) {
			return ;
		}
		//总记录数
		this.totalRecord =sourList.size();
		//每页显示的页数
		this.pageSize=pageSize;
		//获取总页数
		this.totalPage =this.totalRecord/this.pageSize;
		if(this.totalRecord%pageSize!=0) {
			this.totalPage=this.totalPage+1;
		}
		
		//当前第几页数据
		this.currentPage = this.totalPage<pageNum?this.totalPage:pageNum;
		//起始索引
		int fromIndex = this.pageSize*(this.currentPage-1);
		//结束索引
		int toIndex = this.pageSize*this.currentPage>this.totalRecord?this.totalRecord:this.pageSize*this.currentPage;
		this.dataList=sourList.subList(fromIndex, toIndex);
	}
	public Page(int pageSize, int currentPage, int totalRecord, int totalPage, List<T> dataList) {
		super();
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.totalRecord = totalRecord;
		this.totalPage = totalPage;
		this.dataList = dataList;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getDataList() {
		return dataList;
	}
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	
}
