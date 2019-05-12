package com.sulake.core.window.utils
{
    import com.sulake.core.window.graphics.IWindowRenderer;
    import com.sulake.core.window.components.IDesktopWindow;
    import com.sulake.core.window.IWindow;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IInputEventTracker;

    public class EventProcessorState 
    {
        public var renderer:IWindowRenderer;
        public var desktop:IDesktopWindow;
        public var hoverWindow:IWindow;
        public var lastClickTarget:IWindow;
        public var eventTrackers:Vector.<IInputEventTracker>;

        public function EventProcessorState(renderer:IWindowRenderer, desktop:IDesktopWindow, hoverWindow:IWindow, lastClickTarget:IWindow, eventTrackers:Vector.<IInputEventTracker>)
        {
            this.renderer = renderer;
            this.desktop = desktop;
            this.hoverWindow = hoverWindow;
            this.lastClickTarget = lastClickTarget;
            this.eventTrackers = eventTrackers;
        }
    }
}
