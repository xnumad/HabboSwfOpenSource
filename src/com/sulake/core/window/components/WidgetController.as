package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.IWidgetFactory;
    import com.sulake.core.window.IWidget;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;

    public class WidgetController extends WindowController implements IWidgetWindow 
    {
        private var _Str_8197:IWidgetFactory;
        private var _Str_9477:String = "";
        private var _widget:IWidget;

        public function WidgetController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            this._Str_8197 = _arg_5._Str_23058();
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (this._widget != null)
                {
                    this._widget.dispose();
                    this._widget = null;
                }
                this._Str_8197 = null;
                super.dispose();
            }
        }

        override public function get properties():Array
        {
            var k:Array = ((this._widget != null) ? this._widget.properties : []);
            k.unshift(createProperty(PropertyKeys.WIDGET_TYPE, this._Str_9477));
            return super.properties.concat(k);
        }

        override public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            var _local_3:String;
            for each (_local_2 in k)
            {
                if (_local_2.key == PropertyKeys.WIDGET_TYPE)
                {
                    _local_3 = String(_local_2.value);
                    if (this._Str_9477 != _local_3)
                    {
                        if (this._widget != null)
                        {
                            removeChildAt(0);
                            this._widget.dispose();
                        }
                        this._widget = this._Str_8197._Str_2548(String(_local_2.value), this);
                        this._Str_9477 = _local_3;
                    }
                    break;
                }
            }
            if (this._widget != null)
            {
                this._widget.properties = k;
            }
            super.properties = k;
        }

        override public function set color(k:uint):void
        {
            var _local_3:IWindow;
            super.color = k;
            var _local_2:Array = new Array();
            groupChildrenWithTag(WindowController._COLORIZE, _local_2, -1);
            for each (_local_3 in _local_2)
            {
                _local_3.color = k;
            }
        }

        public function get iterator():IIterator
        {
            return (this._widget != null) ? this._widget.iterator : EmptyIterator.INSTANCE;
        }

        public function get widget():IWidget
        {
            return this._widget;
        }

        public function get _Str_2429():IWindow
        {
            return getChildAt(0);
        }

        public function set _Str_2429(k:IWindow):void
        {
            removeChildAt(0);
            if (k == null)
            {
                return;
            }
            addChild(k);
            if (k.tags.indexOf(WindowController.TAG_EXCLUDE) < 0)
            {
                k.tags.push(WindowController.TAG_EXCLUDE);
            }
        }
    }
}
