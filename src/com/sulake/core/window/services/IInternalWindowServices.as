package com.sulake.core.window.services
{
    public interface IInternalWindowServices 
    {
        function getMouseDraggingService():IMouseDraggingService;
        function getMouseScalingService():IMouseScalingService;
        function getMouseListenerService():IMouseListenerService;
        function getFocusManagerService():IFocusManagerService;
        function getToolTipAgentService():IToolTipAgentService;
        function getGestureAgentService():IGestureAgentService;
    }
}
