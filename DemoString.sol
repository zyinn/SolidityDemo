pragma solidity >=0.4.24 <0.8.6;

import "https://github.com/Arachnid/solidity-stringutils/blob/master/src/strings.sol";

contract DemoString {

    string public str1 = "新颜科技";

    // https://www.qqxiuzi.cn/bianma/Unicode-UTF.php
    bytes public bs1 = "新颜科技";

        // utf8 编码长度
    function getLen() public view returns (uint) {
        return bytes(str1).length;
    }
    // E696B0 E9A29C E7A791 E68A80
    function getbyte(uint i) public view returns (byte) {
        return bytes(str1)[i];
    }

    using strings for *;   //表示库strings中的函数可以关联到任意的类型上。
    function getStrLen() public view returns (uint len) {
        len = str1.toSlice().len();
    }



    function testStart() public pure returns (bool ) {
        strings.slice memory s = "ABCDE".toSlice();
        return s.startsWith("AB".toSlice());

    }

    // 转为小写。
    function toLower(string str) internal view returns (string) {
		bytes memory bStr = bytes(str);
		bytes memory bLower = new bytes(bStr.length);
		for (uint i = 0; i < bStr.length; i++) {
			// 大写字母
			if ((bStr[i] >= 0x41) && (bStr[i] <= 0x5A)) {
				// 加 0x20 变为小写
				bLower[i] = bytes1(int(bStr[i]) + 32);
			} else {
				bLower[i] = bStr[i];
			}
		}
		return string(bLower);
	}

}
