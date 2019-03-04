package liu.code.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.sun.beans.editors.DoubleEditor;
import com.sun.beans.editors.FloatEditor;
import com.sun.beans.editors.IntegerEditor;
import com.sun.beans.editors.LongEditor;

import liu.code.entity.Good;
import liu.code.entity.Page;
import liu.code.service.impl.GoodService;
import net.sf.json.JSONObject;

@Controller
public class GoodController {
	@Autowired
	private GoodService goodService;
	/*
	 * 指定类型编辑器
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) { 
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true)); 
        binder.registerCustomEditor(int.class, new IntegerEditor());
        binder.registerCustomEditor(long.class, new LongEditor());  
        binder.registerCustomEditor(double.class, new DoubleEditor());  
        binder.registerCustomEditor(float.class, new FloatEditor());  
    }
	/*
	 *     新增货物
	 */
	@RequestMapping("/goodlist")
	public String addGoods(@Param("goodName") String goodName,@Param("goodType") String goodType,@Param("goodProduct") String goodProduct,@Param("goodPrice") double goodPrice, @Param("goodNum") int goodNum,
			@Param("goodNumPrice") double goodNumPrice) {
		Good good = new Good(goodName, goodType, goodProduct, goodPrice, goodNum, goodNumPrice);
		goodService.addGoods(good);
		return "redirect:/home";
	}
	/*
	 * 查询列表
	 */
	@RequestMapping("/home")
	public String queryGoods(Model model) {
		model.addAttribute("goodList", goodService.queryGoods());
		return "home";
	}
	/*
	 * 查看货物详情
	 */
	@RequestMapping(value="/queryGood/{id}",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject findGoodById(@PathVariable("id") String id) {
		Good good = goodService.findGoodById(Integer.parseInt(id.trim()));
		JSONObject jsonObject = JSONObject.fromObject(good);
		return jsonObject;
	}
	/*
	 *删除库存记录 
	 */
	@RequestMapping("deleteGood/{id}")
	public String deleteGood(@PathVariable("id") int id) {
		goodService.deleteGood(id);
		return "redirect:/home";
	}
	/*
	 *修改库存货品 
	 */
	
	@PostMapping("/updateGoodById/{id}")
	@ResponseBody
	public JSONObject updateGoodById(@PathVariable("id") String id) {
		Good good2 = goodService.findGoodById(Integer.parseInt(id.trim()));
		JSONObject jsonObject2 = JSONObject.fromObject(good2);
		return jsonObject2;
	}
	@PostMapping("/updateGood/updateForm")
	public String updateGood(Good good) {
		
		goodService.updateGood(good);
		return "redirect:/home";
	}
	@RequestMapping("/test")
	public String teString() {
		return "testAJax";
	}
	
	@RequestMapping("/koo/")
	@ResponseBody
	public List<Good> check(Model model) {
		model.addAttribute("list", goodService.queryGoods());
		return goodService.queryGoods();
	}
}
