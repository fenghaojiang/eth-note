package main

import (
	"fmt"

	"github.com/ledgerwatch/erigon/crypto"
)

var (
	EventOwnershipRenounced   = crypto.Keccak256Hash([]byte("OwnershipRenounced(address)"))           //0xf8df31144d9c2f0f6b59d69b8b98abd5459d07f2742c4df920b25aae33c64820
	EventOwnershipTransferred = crypto.Keccak256Hash([]byte("OwnershipTransferred(address,address)")) //0x8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0

	EventOrderApprovedPartOne = crypto.Keccak256Hash([]byte("OrderApprovedPartOne(bytes32,address,address,address,uint256,uint256,uint256,uint256,address,uint8,uint8,uint8,address)")) //0xc1867553a69941d7ac90f4d765e121254065f672ae6a8911b6fbfa08eb395c0b
	EventOrderApprovedPartTwo = crypto.Keccak256Hash([]byte("OrderApprovedPartTwo(bytes32,uint8,bytes,bytes,address,bytes,address,uint256,uint256,uint256,uint256,uint256,bool)"))      //0x4c2b88f0afbbe158412537dd676cb01117993e7e89ed77b5b643492df9d02476
	EventOrderCancelled       = crypto.Keccak256Hash([]byte("OrderCancelled(bytes32)"))                                                                                                 //0x5152abf959f6564662358c2e52b702259b78bac5ee7842a0f01937e670efcc7d
	EventOrdersMatched        = crypto.Keccak256Hash([]byte("OrdersMatched(bytes32,bytes32,address,address,uint256,bytes32)"))                                                          //0x7f41034c29a1496bf174f2c182cce54b3b1eb1844c80b7f4dcc9df3fa27c0513
	EventNonceIncremented     = crypto.Keccak256Hash([]byte("NonceIncremented(address,uint256)"))                                                                                       //0xd87be783eba76bfb6f5fe3325337f5047550c33056e4065e202de29a62a1dfd7
)

func main() {
	//doPost()
	// uniswapV2 := "0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f"
	// uniswapV3 := "0x1F98431c8aD98523631AE4a59f267346ea31F984"
	// openSea := "0x7Be8076f4EA4A4AD08075C2508e481d6C946D12b"
	// openSeaV2 := "0x7f268357A8c2552623316e2562D90e642bB538E5"

	// fmt.Println(strings.ToLower(uniswapV2))
	// fmt.Println(strings.ToLower(uniswapV3))
	// fmt.Println("opensea:", strings.ToLower(openSea))
	// fmt.Println("opensea v2:", strings.ToLower(openSeaV2))

	fmt.Println(EventOrderApprovedPartOne)
	fmt.Println(EventOrderApprovedPartTwo)

	fmt.Println(EventOrderCancelled)
	fmt.Println(EventOrdersMatched)

	fmt.Println(EventNonceIncremented)

	fmt.Println(EventOwnershipRenounced)
	fmt.Println(EventOwnershipTransferred)

	// a := [32]byte{133, 142, 178, 117, 92, 63, 156, 130, 8, 203, 177, 234, 236, 0, 45, 2, 128, 81, 16, 222, 252, 7, 228, 107, 44, 114, 97, 62, 96, 94, 130, 160}

	// fmt.Println("0x" + hex.EncodeToString(a[:]))
	// fmt.Println(fmt.Sprintf("%x", a), len(fmt.Sprintf("%x", a)))

	// fmt.Println(len("x68f0bcaa000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000003e000000000000000000000000000000000000000000000000000000000000007400000000000000000000000000000000000000000000000000000000000000aa0000000000000000000000000000000000000000000000000000000000000001a0000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad55760000000000000000000000002af75676692817d85121353f0d6e8e9ae6ad5576000000000000000000000000000000000000000000000000000000000000001a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001a00000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000000c400000000000000000000000000000000000000000000000000000000000013e8f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c0000000000000000000000000000000000000000000000000000000000000000800100020000000100060000000000016802e602de0000000000000000007d67000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c0000000000000000000000000000000000000000000000000000000000000000800100020000000300050000000000022b01c1027800000000000000000079ed000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c000000000000000000000000000000000000000000000000000000000000000080010002000000040004000000000002c2027202370000000000000000006674000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c0000000000000000000000000000000000000000000000000000000000000000800100020000000500060000000000025c01af017a0000000000000000007c45000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c000000000000000000000000000000000000000000000000000000000000000080010002000000080006000000000002a2019301c90000000000000000007e52000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c0000000000000000000000000000000000000000000000000000000000000000800100020000000a0006000000000002dc017d02c10000000000000000007d6c000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c0000000000000000000000000000000000000000000000000000000000000000800200020000000100050000000000025001f9025200000000000000000076dc000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c0000000000000000000000000000000000000000000000000000000000000000800200020000000200060000000000028601ee020e0000000000000000007c3b000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c0000000000000000000000000000000000000000000000000000000000000000800200020000000300060000000000012e01d502450000000000000000007998000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c000000000000000000000000000000000000000000000000000000000000000080020002000000040006000000000002a3029b01df0000000000000000007bfa000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c0000000000000000000000000000000000000000000000000000000000000000800200020000000700060000000000023402c4014f0000000000000000007e57000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c000000000000000000000000000000000000000000000000000000000000000080020002000000080006000000000001810279017d0000000000000000007e48000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c0000000000000000000000000000000000000000000000000000000000000000800200020000000a00060000000000020001b8025f0000000000000000007ec0000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c000000000000000000000000000000000000000000000000000000000000000080030202000000000006000000000000bd019900b80000000000000000004436000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c0000000000000000000000000000000000000000000000000000000000000000800303020000000000050000000000017900f101910000000000000000001459000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c00000000000000000000000000000000000000000000000000000000000000008003040200000000000500000000000158015601c2000000000000000000435c000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c00000000000000000000000000000000000000000000000000000000000000008003050200000000000500000000000157018e01b3000000000000000000435b000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c000000000000000000000000000000000000000000000000000000000000000080030602000000000006000000000000cc00e400f2000000000000000000488e000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c0000000000000000000000000000000000000000000000000000000000000000800308020000000000060000000000010d00e40181000000000000000000760a000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c000000000000000000000000000000000000000000000000000000000000000080040102000000000006000000000000f0018200bd0000000000000000002ef8000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c0000000000000000000000000000000000000000000000000000000000000000800402020000000000060000000000013a01950121000000000000000000233b000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c000000000000000000000000000000000000000000000000000000000000000080040302000000000006000000000000c5017e00b0000000000000000000435a000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c00000000000000000000000000000000000000000000000000000000000000008004040200000000000500000000000114011d00ef0000000000000000004438000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c000000000000000000000000000000000000000000000000000000000000000080050102000000000006000000000000cb01710112000000000000000000442d000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c0000000000000000000000000000000000000000000000000000000000000000800502020000000000050000000000018f01660107000000000000000000433d000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000f242432a000000000000000000000000d53099eef213e13bb2e78467d5073467f9878d0c00000000000000000000000000000000000000000000000000000000000000008005040200000000000400000000000188017d012a0000000000000000004437000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"))

}
