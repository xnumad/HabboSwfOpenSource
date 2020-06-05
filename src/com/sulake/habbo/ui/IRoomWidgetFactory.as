package com.sulake.habbo.ui
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.ui.widget.IRoomWidget;

    public interface IRoomWidgetFactory extends IDisposable 
    {
        function createWidget(_arg_1:String, _arg_2:IRoomWidgetHandler):IRoomWidget;
    }
}
