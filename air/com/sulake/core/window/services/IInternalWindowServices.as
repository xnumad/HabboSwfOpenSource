//com.sulake.core.window.services.IInternalWindowServices

package com.sulake.core.window.services{
    public /*dynamic*/ interface IInternalWindowServices {

        function getMouseDraggingService():IMouseDraggingService;
        function getMouseScalingService():IMouseScalingService;
        function getMouseListenerService():IMouseListenerService;
        function getFocusManagerService():IFocusManagerService;
        function getToolTipAgentService():IToolTipAgentService;
        function getGestureAgentService():IGestureAgentService;

    }
}//package com.sulake.core.window.services

