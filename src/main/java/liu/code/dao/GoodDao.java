package liu.code.dao;

import java.util.List;

import liu.code.entity.Good;
import liu.code.entity.Page;

public interface GoodDao {
	/*
	 *      新增库存
	 * @param good  货物对象
	 */
	Integer addGoods(Good good);
	/*
	 *      查询列表
	 */
	List<Good> queryGoods();
	/*
	 *     查询详情
	 */
	Good findGoodById(int id);
	/*
	 * 删除库存记录
	 */
	void deleteGood(int id);
	/*
	 * 查询
	 */
	void updateGood(Good good);
	public Page<Good> findPage(Good good, int pageNum, int pageSize);
	
	
}
