package com.internousdev.casablanca.action;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.casablanca.dao.MCategoryDAO;
import com.internousdev.casablanca.dao.ProductInfoDAO;
import com.internousdev.casablanca.dto.MCategoryDTO;
import com.internousdev.casablanca.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ProductDetailsAction extends ActionSupport implements SessionAware{
	private Map<String,Object>session;
	private List<ProductInfoDTO>productInfoDTOList;
	private ProductInfoDTO productInfoDTO=new ProductInfoDTO();
	private int productId;

	public String execute() {
		String result = ERROR;
		if (productId == 0) {
		} else {
			ProductInfoDAO productInfoDAO = new ProductInfoDAO();
			productInfoDTO = productInfoDAO.getProductInfo(productId);
			productInfoDTOList = productInfoDAO.getProdctInfoListByCategoryId(productInfoDTO.getCategoryId(), productInfoDTO.getProductId(),0,3);
			result = SUCCESS;
		}
		if(!session.containsKey("mCategoryDtoList")){
			MCategoryDAO mCategoryDAO = new MCategoryDAO();
			List<MCategoryDTO> mCategoryDtoList = mCategoryDAO.getMCategoryList();
			session.put("mCategoryDtoList", mCategoryDtoList);
		}
		return result;
	}

	public ProductInfoDTO getProductInfoDTO() {
		return productInfoDTO;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public List<ProductInfoDTO> getProductInfoDTOList() {
		return productInfoDTOList;
	}
	public void setSession(Map<String, Object>session) {
		this.session=session;
	}
}
