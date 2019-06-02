package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.utils.IIterable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.events.WindowEvent;

    public class TabContextController extends WindowController implements ITabContextWindow, IIterable 
    {
        private static const _SELECTOR:String = "_SELECTOR";
        private static const _CONTENT:String = "_CONTENT";

        protected var _Str_9660:ISelectorListWindow;
        protected var _Str_17833:IWindowContainer;
        private var _Str_12981:Boolean = false;
        private var _initialized:Boolean = false;

        public function TabContextController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            var _local_13:IWindow;
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            var _local_12:Array = new Array();
            groupChildrenWithTag(WindowController.TAG_INTERNAL, _local_12, -1);
            for each (_local_13 in _local_12)
            {
                _local_13.style = _style;
                _local_13.procedure = this._Str_20308;
            }
            this._initialized = true;
        }

        public function get selector():ISelectorListWindow
        {
            if (this._Str_9660 == null)
            {
                this._Str_9660 = (findChildByTag(_SELECTOR) as ISelectorListWindow);
                if (this._Str_9660 != null)
                {
                    this._Str_9660.procedure = this._Str_20308;
                }
            }
            return this._Str_9660;
        }

        public function get container():IWindowContainer
        {
            if (this._Str_17833 == null)
            {
                this._Str_17833 = (findChildByTag(_CONTENT) as IWindowContainer);
            }
            return this._Str_17833;
        }

        public function get iterator():IIterator
        {
            return (this._initialized) ? this.selector.iterator : null;
        }

        public function get _Str_4277():uint
        {
            return this._Str_9660.numSelectables;
        }

        public function _Str_5377(k:ITabButtonWindow):ITabButtonWindow
        {
            return this.selector.addSelectable(k) as ITabButtonWindow;
        }

        public function _Str_25454(k:ITabButtonWindow, _arg_2:uint):ITabButtonWindow
        {
            return this.selector.addSelectableAt(k, _arg_2) as ITabButtonWindow;
        }

        public function _Str_5897(k:ITabButtonWindow):void
        {
            this.selector.removeSelectable(k);
        }

        public function _Str_3363(k:uint):ITabButtonWindow
        {
            return this.selector.getSelectableAt(k) as ITabButtonWindow;
        }

        public function _Str_19493(k:String):ITabButtonWindow
        {
            return this.selector.getSelectableByName(k) as ITabButtonWindow;
        }

        public function _Str_20824(k:uint):ITabButtonWindow
        {
            return this.selector.getSelectableByID(k) as ITabButtonWindow;
        }

        public function _Str_23344(k:ITabButtonWindow):uint
        {
            return this.selector.getSelectableIndex(k);
        }

        private function _Str_20308(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_SELECTED)
            {
                _Str_21166(k);
            }
        }
    }
}
