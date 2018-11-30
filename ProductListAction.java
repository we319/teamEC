package com.internousdev.casablanca.action;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.casablanca.dao.MCategoryDAO;
import com.internousdev.casablanca.dao.ProductInfoDAO;
import com.internousdev.casablanca.dto.MCategoryDTO;
import com.internousdev.casablanca.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;
public class ProductListAction extends ActionSupport implements SessionAware {

	private ArrayList<ProductInfoDTO> productInfoDtoList;
	private Map<String,Object>session;

	public String execute() {
		ProductInfoDAO productInfoDAO = new ProductInfoDAO();
		productInfoDtoList = productInfoDAO.getProductList();
		if(!session.containsKey("mCategoryDtoList")){
			MCategoryDAO mCategoryDAO = new MCategoryDAO();
			List<MCategoryDTO> mCategoryDtoList = mCategoryDAO.getMCategoryList();
			session.put("mCategoryDtoList", mCategoryDtoList);
		}
		if(Objects.equals(session.get("fromCart"), true)) {
			session.remove("fromCart");
		}
		return SUCCESS;
	}

	public ArrayList<ProductInfoDTO> getProductInfoDtoList(){
		return productInfoDtoList;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
