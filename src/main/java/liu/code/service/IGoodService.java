package liu.code.service;

import java.util.List;

import liu.code.entity.Good;
import liu.code.entity.Page;

public interface IGoodService {
	/*
	 *     新增货物
	 */
	Integer addGoods(Good good);
	/*
	 *    查询货物清单
	 */
	List<Good> queryGoods();
	/*
	 *   查看详情
	 */
	Good findGoodById(int id);
	/*
	 * 删除库存记录
	 */
	void deleteGood(int id);
	/*
	 * 修改库存货物
	 */
	void updateGood(Good good);
	public Page<Good> findPage(Good good,int pageNum,int pageSize);
}


