package com.sulake.core.window.graphics
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.graphics.renderer.ISkinRenderer;
    import com.sulake.core.window.utils.DefaultAttStruct;

    public interface ISkinContainer extends IDisposable 
    {
        function _Str_18054(_arg_1:uint, _arg_2:uint):ISkinRenderer;
        function _Str_21732(_arg_1:uint, _arg_2:uint):DefaultAttStruct;
        function _Str_15965(_arg_1:uint, _arg_2:uint, _arg_3:uint):uint;
    }
}
