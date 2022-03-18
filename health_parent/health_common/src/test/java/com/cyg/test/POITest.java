package com.cyg.test;

import org.junit.Test;

import java.io.IOException;
import java.text.ParseException;

/**
 * @author CuiYuangeng
 * @create 2022-02-20 20:01
 */
public class POITest {

    // 使用POI读取excel数据
    @Test
    public void test01() throws IOException {
        //// 加载指定文件，创建一个Excel对象
        //XSSFWorkbook excel = new XSSFWorkbook(new FileInputStream(new File("F:\\qiniu\\test\\poi.xlsx")));
        //// 读取Excel文件中第一个Sheet标签页
        //XSSFSheet sheet = excel.getSheetAt(0);
        //// 遍历sheet标签页，获取每一行数据
        //for (Row row : sheet) {
        //    // 遍历行，获取每个单元格对象
        //    for (Cell cell : row) {
        //        System.out.println(cell.getStringCellValue());
        //    }
        //}
        //// 关闭资源
        //excel.close();
    }

    @Test
    public void test02() throws IOException {
        //XSSFWorkbook excel = new XSSFWorkbook(new FileInputStream(new File("F:\\qiniu\\test\\poi.xlsx")));
        //// 读取excel文件中的第一个sheet标签页
        //XSSFSheet sheet = excel.getSheetAt(0);
        //// 获取当前sheet中最后一行的行号，行号从0开始
        //int lastRowNum = sheet.getLastRowNum();
        //System.out.println("lastRowNum = " + lastRowNum);
        //for (int i = 0; i <= lastRowNum; i++) {
        //    XSSFRow row = sheet.getRow(i);
        //    short lastCellNum = row.getLastCellNum();
        //    System.out.println(lastCellNum);
        //    for (int j = 0; j < lastCellNum; j++) {
        //        XSSFCell cell = row.getCell(j);
        //        String value = cell.getStringCellValue();
        //        System.out.println("value = " + value);
        //    }
        //}
        //excel.close();
    }

    /**
     * 使用POI向Excel文件写入数据，并通过输出流将创建的Excel文件保存到本地磁盘
     */
    @Test
    public void test03() throws IOException, ParseException {
        //// 在内存中创建一个excel文件
        //XSSFWorkbook excel = new XSSFWorkbook();
        //// 创建工作表对象
        //XSSFSheet sheet = excel.createSheet();
        //// 在工作表中创建行对象
        //XSSFRow row = sheet.createRow(0);
        //// 在行中创建单元格对象
        //row.createCell(0).setCellValue("姓名");
        //row.createCell(1).setCellValue("年龄");
        //row.createCell(2).setCellValue("毕业时间");
        //
        //XSSFRow row1 = sheet.createRow(1);
        //row1.createCell(0).setCellValue("小明");
        //row1.createCell(2).setCellValue(new Date());
        //row1.createCell(1).setCellValue(22);
        //// 创建一个输出流，通过输出流将内存中的excel文件写到磁盘
        //FileOutputStream out = new FileOutputStream(new File("F:\\qiniu\\test\\poi2.xlsx"));
        //excel.write(out);
        //out.flush();
        //excel.close();
    }
}
