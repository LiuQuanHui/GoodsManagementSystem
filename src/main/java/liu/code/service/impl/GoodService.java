package liu.code.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import liu.code.dao.GoodDao;
import liu.code.entity.Good;
import liu.code.entity.Page;
import liu.code.service.IGoodService;
@Service
public class GoodService implements IGoodService{
	/*
	 *       新增库存
	 * @param good:货物对象
	 */
	@Autowired
	private GoodDao goodDao;
	
	public Integer addGoods(Good good) {
		return goodDao.addGoods(good);
	}
	
	public List<Good> queryGoods() {
		return goodDao.queryGoods();
	}
	
	public Good findGoodById(int id) {
		
		return goodDao.findGoodById(id);
	}
	
	public void deleteGood(int id) {
		goodDao.deleteGood(id);
	}

	public void updateGood(Good good) {
		 goodDao.updateGood(good);
		
	}

	public Page<Good> findPage(Good good, int pageNum, int pageSize) {
		List<Good> resultGoods = goodDao.queryGoods();
		Page<Good> page = new Page<Good>(pageSize, pageNum, resultGoods);
		return page;
	}

}
