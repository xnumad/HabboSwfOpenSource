package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime.IUnknown;

    public interface IHabboModeration extends IUnknown 
    {
        function _Str_9380(_arg_1:int, _arg_2:String, figure:String = null, gender:String = null):void;
		
		function setVisible(visible:Boolean):void;
    }
}
