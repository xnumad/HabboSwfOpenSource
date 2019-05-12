package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISlotAwareWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces._Str_6397;
    import com.sulake.habbo.friendbar.landingview.interfaces.IDisableAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.layout.DynamicLayoutManager;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.friendbar.landingview.widget.elements.WidgetElementHandler;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.ILayoutNameProvider;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IFloatingElement;
    import com.sulake.habbo.friendbar.landingview.widget.elements.TitleElementHandler;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3695;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3198;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IDisableAwareElement;
    import com.sulake.habbo.friendbar.landingview.*;

    public class GenericWidget implements ILandingViewWidget, ISlotAwareWidget, ISettingsAwareWidget, _Str_6397, IDisableAwareWidget 
    {
        private var _landingView:HabboLandingView;
        private var _container:IWindowContainer;
        private var _slot:int;
        private var _configurationCode:String;
        private var _elements:Map;

        public function GenericWidget(k:HabboLandingView)
        {
            this._landingView = k;
            this._elements = new Map();
        }

        public static function _Str_18803(k:HabboLandingView, _arg_2:int, _arg_3:String, _arg_4:IWindowContainer):void
        {
            var _local_9:String;
            var _local_10:Array;
            var _local_11:String;
            var _local_12:String;
            var _local_5:String = _Str_13923(k, _arg_2, _arg_3, "layout");
            var _local_6:Array = _local_5.split(";");
            var _local_7:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_arg_4.findChildByName("bitmap"));
            var _local_8:IWindow = _arg_4.findChildByName("content_container");
            _local_8.x = ((_Str_6981(_arg_2)) ? DynamicLayoutManager._Str_16813 : 0);
            _arg_4.width = ((_Str_6981(_arg_2)) ? k._Str_11168 : k._Str_9931);
            for each (_local_9 in _local_6)
            {
                _local_10 = _local_9.split(",");
                _local_11 = _local_10[0];
                _local_12 = _local_10[1];
                switch (_local_11)
                {
                    case "bitmap.uri":
                        _local_7.assetUri = _local_12;
                        break;
                    case "bitmap.width":
                        _local_7.width = parseInt(_local_12);
                        break;
                    case "bitmap.height":
                        _local_7.height = parseInt(_local_12);
                        break;
                    case "bitmap.x":
                        _local_7.x = parseInt(_local_12);
                        break;
                    case "bitmap.y":
                        _local_7.y = parseInt(_local_12);
                        break;
                    case "content.x":
                        _local_8.x = parseInt(_local_12);
                        break;
                    case "content.y":
                        _local_8.y = parseInt(_local_12);
                        break;
                    case "content.width":
                        _local_8.width = parseInt(_local_12);
                        break;
                    case "container.height":
                        _arg_4.height = Math.max(parseInt(_local_12), _arg_4.height);
                        break;
                }
            }
        }

        private static function _Str_13923(k:HabboLandingView, _arg_2:int, _arg_3:String, _arg_4:String):String
        {
            var _local_5:String = ((_arg_3 != null) ? (((("landing.view." + _arg_3) + ".") + _arg_4)) : (((("landing.view.dynamic.slot." + _arg_2) + ".") + _arg_4)));
            return k.getProperty(_local_5);
        }

        private static function _Str_6981(k:int):Boolean
        {
            return (!(k == 3)) && (!(k == 5));
        }


        public function set slot(k:int):void
        {
            this._slot = k;
        }

        public function get _Str_12275():String
        {
            return this._configurationCode;
        }

        public function set _Str_12275(k:String):void
        {
            this._configurationCode = k;
        }

        public function get container():IWindow
        {
            return this._container;
        }

        public function dispose():void
        {
            var k:IElementHandler;
            this._landingView = null;
            this._container = null;
            for each (k in this._elements)
            {
                if ((k is IDisposable))
                {
                    IDisposable(k).dispose();
                }
            }
            this._elements = null;
        }

        public function initialize():void
        {
            this._container = IWindowContainer(this._landingView.getXmlWindow("generic_widget"));
            this._Str_23364();
            _Str_18803(this._landingView, this._slot, this._configurationCode, this._container);
        }

        public function _Str_19931(k:String):IElementHandler
        {
            return this._elements.getValue(k) as IElementHandler;
        }

        private function _Str_23364():void
        {
            var elementData:String;
            var fields:Array;
            var elementName:String;
            var handler:IElementHandler;
            var layoutName:String;
            var elementWindow:IWindow;
            var data:String = _Str_13923(this._landingView, this._slot, this._configurationCode, "conf");
            var elementDatas:Array = data.split(";");
            if (((data == null) || (data == "")))
            {
                return;
            }
            var itemlist:IItemListWindow = IItemListWindow(this._container.findChildByName("content_container"));
            for each (elementData in elementDatas)
            {
                fields = elementData.split(",");
                elementName = fields[0];
                handler = WidgetElementHandler._Str_24129(elementName);
                layoutName = ((handler is ILayoutNameProvider) ? ILayoutNameProvider(handler).layoutName : ("element_" + elementName));
                Logger.log(("Element: " + layoutName));
                try
                {
                    elementWindow = this._landingView.getXmlWindow(layoutName);
                }
                catch(e:Error)
                {
                    return;
                }
                if (elementWindow == null)
                {
                    return;
                }
                if (handler != null)
                {
                    handler.initialize(this._landingView, elementWindow, fields, this);
                    this._elements.add(elementName, handler);
                }
                if (((handler is IFloatingElement) && (IFloatingElement(handler)._Str_7806(_Str_6981(this._slot)))))
                {
                    if ((handler is TitleElementHandler))
                    {
                        elementWindow.width = ((_Str_6981(this._slot)) ? this._landingView._Str_11168 : this._landingView._Str_9931);
                    }
                    this._container.addChild(elementWindow);
                }
                else
                {
                    itemlist.addListItem(elementWindow);
                }
            }
        }

        public function refresh():void
        {
            var k:IElementHandler;
            for each (k in this._elements)
            {
                k.refresh();
            }
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        public function set settings(k:_Str_3198):void
        {
            _Str_3695._Str_5630(this._container, k);
        }

        public function disable():void
        {
            var k:IElementHandler;
            for each (k in this._elements)
            {
                if ((k is IDisableAwareElement))
                {
                    IDisableAwareElement(k).disable();
                }
            }
        }
    }
}
