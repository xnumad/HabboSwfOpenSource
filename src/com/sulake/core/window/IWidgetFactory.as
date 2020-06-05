package com.sulake.core.window
{
    import com.sulake.core.window.components.IWidgetWindow;

    public interface IWidgetFactory 
    {
        function createWidget(_arg_1:String, _arg_2:IWidgetWindow):IWidget;
    }
}
