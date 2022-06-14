package dao;

import java.util.ArrayList;
import java.util.List;

import dto.product;

public class productRepository {
	private ArrayList<product> listOfProducts = new ArrayList<product>();
	private static productRepository instance = new productRepository();

	public productRepository() {
		product phone = new product("P1234", "iphone 6s", 800000);
		phone.setDescription("4.7-inch, 1334X750 Retina HD display, 8-megapixe");
		phone.setCategory("smart phone");
		phone.setManufacture("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("new");
		phone.setFilename("P1234.png");

		product notebook = new product("P1235", "LG pc 그램", 150000);
		notebook.setDescription("13.3-inch, IPS LED display , 5rd Generation Inter Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacture("LG");
		notebook.setUnitsInStock(10000000);
		notebook.setCondition("refurbished");
		notebook.setFilename("P1235.png");

		product tablet = new product("P1236", "Galaxy Tab s", 900000);
		tablet.setDescription("212.8*125.6*6.6mm,Super AMOLED display , Octacore processor");
		tablet.setCategory("Tablet");
		tablet.setManufacture("SamSung");
		tablet.setUnitPrice(7000000);
		tablet.setCondition("old");
		tablet.setFilename("P1236.png");

		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);

	}

	// 모든상품조회
	public ArrayList<product> getAllproducts() {
		return listOfProducts;
	}

	public static productRepository getInstance() {
		return instance;
	}

	// 상품조회
	public product getProductById(String productId) {
		product productById = null;

		for (int i = 0; i < listOfProducts.size(); i++) {
			product product = listOfProducts.get(i);
			if (product != null && product.getproductId() != null && product.getproductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}

	public void addproduct(product product) {
		listOfProducts.add(product);
	}
}
 