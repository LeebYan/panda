package com.pig4cloud.pigx.admin;

import java.util.BitSet;

/**
 * @author lengleng
 * @date 2019-03-26
 */
public class BitMapTest {
	private int[] bigArray;

	public BitMapTest(long size) {
		bigArray = new int[(int) (size / 32 + 1)];
	}

	public void set1(int num) {
		//确定数组 index
		int arrayIndex = num >> 5;
		//确定bit index
		int bitIndex = num & 31;
		//设置0
		bigArray[arrayIndex] |= 1 << bitIndex;

		System.out.println(bigArray[arrayIndex]);
	}

	public void set0(int num) {
		//确定数组 index
		int arrayIndex = num >> 5;
		//确定bit index
		int bitIndex = num & 31;
		//设置0
		bigArray[arrayIndex] &= ~(1 << bitIndex);
		System.out.println(get32BitBinString(bigArray[arrayIndex]));
	}

	public boolean isExist(int num) {
		//确定数组 index
		int arrayIndex = num >> 5;
		//确定bit index
		int bitIndex = num & 31;

		//判断是否存在
		return (bigArray[arrayIndex] & ((1 << bitIndex))) != 0;
	}

	/**
	 * 将整型数字转换为二进制字符串，一共32位，不舍弃前面的0
	 *
	 * @param number 整型数字
	 * @return 二进制字符串
	 */
	private static String get32BitBinString(int number) {
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i < 32; i++) {
			sBuilder.append(number & 1);
			number = number >>> 1;
		}
		return sBuilder.reverse().toString();
	}

	public static void main(String[] args) {

		int[] array = new int[]{1, 2, 3, 22, 0, 3, 63};
		BitSet bitSet = new BitSet(1);
		System.out.println(bitSet.size());   //64
		bitSet = new BitSet(65);
		System.out.println(bitSet.size());   //128
		bitSet = new BitSet(23);
		System.out.println(bitSet.size());   //64

		//将数组内容组bitmap
		for (int i = 0; i < array.length; i++) {
			bitSet.set(array[i], true);
		}

		System.out.println(bitSet.get(22));
		System.out.println(bitSet.get(60));

		System.out.println("下面开始遍历BitSet：");
		for (int i = 0; i < bitSet.size(); i++) {
			System.out.println(bitSet.get(i));
		}
	}

}
