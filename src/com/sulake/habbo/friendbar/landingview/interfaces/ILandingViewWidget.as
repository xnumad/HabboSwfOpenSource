package com.sulake.habbo.friendbar.landingview.interfaces
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindow;

    public interface ILandingViewWidget extends IDisposable 
    {
        function initialize():void;
        function refresh():void;
        function get container():IWindow;
    }
}
