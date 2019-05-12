package com.sulake.core.window.services
{
    import com.sulake.core.runtime.IDisposable;
    import flash.display.DisplayObject;
    import com.sulake.core.window.IWindowContext;

    public class ServiceManager implements IInternalWindowServices, IDisposable 
    {
        private var _rid:uint;
        private var _root:DisplayObject;
        private var _disposed:Boolean = false;
        private var _windowContext:IWindowContext;
        private var _windowMouseDragger:IMouseDraggingService;
        private var _windowMouseScaler:IMouseScalingService;
        private var _windowMouseListener:IMouseListenerService;
        private var _windowFocusManager:IFocusManagerService;
        private var _windowToolTipAgent:IToolTipAgentService;
        private var _windowGestureAgent:IGestureAgentService;

        public function ServiceManager(k:IWindowContext, _arg_2:DisplayObject)
        {
            this._rid = 0;
            this._root = _arg_2;
            this._windowContext = k;
            this._windowMouseDragger = new WindowMouseDragger(_arg_2);
            this._windowMouseScaler = new WindowMouseScaler(_arg_2);
            this._windowMouseListener = new WindowMouseListener(_arg_2);
            this._windowFocusManager = new FocusManager(_arg_2);
            this._windowToolTipAgent = new WindowToolTipAgent(_arg_2);
            this._windowGestureAgent = new GestureAgentService();
        }

        public function dispose():void
        {
            if (this._windowMouseDragger != null)
            {
                this._windowMouseDragger.dispose();
                this._windowMouseDragger = null;
            }
            if (this._windowMouseScaler != null)
            {
                this._windowMouseScaler.dispose();
                this._windowMouseScaler = null;
            }
            if (this._windowMouseListener != null)
            {
                this._windowMouseListener.dispose();
                this._windowMouseListener = null;
            }
            if (this._windowFocusManager != null)
            {
                this._windowFocusManager.dispose();
                this._windowFocusManager = null;
            }
            if (this._windowToolTipAgent != null)
            {
                this._windowToolTipAgent.dispose();
                this._windowToolTipAgent = null;
            }
            if (this._windowGestureAgent != null)
            {
                this._windowGestureAgent.dispose();
                this._windowGestureAgent = null;
            }
            this._root = null;
            this._windowContext = null;
            this._disposed = true;
        }

        public function getMouseDraggingService():IMouseDraggingService
        {
            return this._windowMouseDragger;
        }

        public function getMouseScalingService():IMouseScalingService
        {
            return this._windowMouseScaler;
        }

        public function getMouseListenerService():IMouseListenerService
        {
            return this._windowMouseListener;
        }

        public function getFocusManagerService():IFocusManagerService
        {
            return this._windowFocusManager;
        }

        public function getToolTipAgentService():IToolTipAgentService
        {
            return this._windowToolTipAgent;
        }

        public function getGestureAgentService():IGestureAgentService
        {
            return this._windowGestureAgent;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }
    }
}
