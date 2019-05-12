package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.graphics.GraphicContext;
    import com.sulake.core.window.graphics.IGraphicContext;
    import flash.display.DisplayObject;
    import com.sulake.core.window.events.WindowEvent;

    public class DesktopController extends ActivatorController implements IDesktopWindow, IDisplayObjectWrapper 
    {
        public function DesktopController(k:String, _arg_2:WindowContext, _arg_3:Rectangle)
        {
            super(k, 0, 0, 0, _arg_2, _arg_3, null, this._Str_19694, null, null, 0);
        }

        public function get mouseX():int
        {
            return this.getDisplayObject().stage.mouseX;
        }

        public function get mouseY():int
        {
            return this.getDisplayObject().stage.mouseY;
        }

        override public function set parent(k:IWindow):void
        {
            throw (new Error("Desktop window doesn't have parent!"));
        }

        override public function set procedure(k:Function):void
        {
            _Str_6620 = ((k != null) ? k : this._Str_19694);
        }

        override public function get host():IWindow
        {
            return this;
        }

        override public function get desktop():IDesktopWindow
        {
            return this;
        }

        override public function getGraphicContext(k:Boolean):IGraphicContext
        {
            if (((k) && (!(_Str_2624))))
            {
                _Str_2624 = new GraphicContext((("GC {" + _name) + "}"), GraphicContext.GC_TYPE_DESKTOP, rectangle);
                GraphicContext(_Str_2624).mouseEnabled = true;
                GraphicContext(_Str_2624).doubleClickEnabled = true;
            }
            return _Str_2624;
        }

        public function getActiveWindow():IWindow
        {
            return getActiveChild();
        }

        public function setActiveWindow(k:IWindow):IWindow
        {
            return setActiveChild(k);
        }

        public function getDisplayObject():DisplayObject
        {
            return this.getGraphicContext(true) as DisplayObject;
        }

        public function setDisplayObject(k:DisplayObject):void
        {
            this.getGraphicContext(true).setDisplayObject(k);
        }

        override public function invalidate(k:Rectangle=null):void
        {
        }

        private function _Str_19694(k:WindowEvent, _arg_2:IWindow):void
        {
        }
    }
}
