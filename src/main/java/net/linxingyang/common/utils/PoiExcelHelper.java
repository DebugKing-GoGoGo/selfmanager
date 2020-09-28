package net.linxingyang.common.utils;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;

public class PoiExcelHelper {

	public static HSSFRow getRow(HSSFSheet sheet, int rowIndex) {
		return sheet.getRow(rowIndex);
	} 
	
	
}
