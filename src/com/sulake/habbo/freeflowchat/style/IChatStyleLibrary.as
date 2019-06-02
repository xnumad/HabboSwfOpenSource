package com.sulake.habbo.freeflowchat.style
{
	import com.sulake.habbo.freeflowchat.style.IChatStyle;
    public interface IChatStyleLibrary 
    {
        function getStyleIds():Array;
        function getStyle(_arg_1:int):IChatStyle;
    }
}
