package com.sulake.core.window.utils
{
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IWindow;

    public interface IChildWindowHost 
    {
        function get children():Vector.<IWindow>;
    }
}
