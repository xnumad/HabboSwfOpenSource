package com.hurlant.math
{
    import com.hurlant.math.BigInteger;

    internal interface IReduction
	{
		function convert(x:BigInteger):BigInteger;
		function revert(x:BigInteger):BigInteger;
		function reduce(x:BigInteger):void;
		function mulTo(x:BigInteger, y:BigInteger, r:BigInteger):void;
		function sqrTo(x:BigInteger, r:BigInteger):void;
	}
}
