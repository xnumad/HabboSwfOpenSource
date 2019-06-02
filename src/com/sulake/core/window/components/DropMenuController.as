package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.PropertyStruct;

    public class DropMenuController extends DropBaseController implements IDropMenuWindow 
    {
        private static const _Str_15603:int = 200;

        private var _stringArray:Array;

        public function DropMenuController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            this._stringArray = [];
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        override public function dispose():void
        {
            this._stringArray = null;
            super.dispose();
        }

        override public function populate(k:Array):void
        {
            _Str_3371 = -1;
            while (this._stringArray.length > 0)
            {
                this._stringArray.pop();
            }
            var _local_2:uint;
            while (_local_2 < k.length)
            {
                this._stringArray.push(k[_local_2]);
                _local_2++;
            }
            _Str_3943 = true;
            this.closeExpandedMenuView();
        }

        public function _Str_24893(k:Vector.<String>):void
        {
            _Str_3371 = -1;
            while (this._stringArray.length > 0)
            {
                this._stringArray.pop();
            }
            var _local_2:uint;
            while (_local_2 < k.length)
            {
                this._stringArray.push(k[_local_2]);
                _local_2++;
            }
            _Str_3943 = true;
            this.closeExpandedMenuView();
        }

        override protected function populateExpandedMenu(k:Vector.<IWindow>, _arg_2:DropBaseController, _arg_3:Function):void
        {
            var _local_6:IDropListItemWindow;
            var _local_12:String;
            if (!_arg_2)
            {
                return;
            }
            var _local_4:IItemListWindow = _arg_2._Str_8828();
            _local_4.autoArrangeItems = false;
            _arg_2._Str_3679().visible = false;
            var _local_5:uint = this._stringArray.length;
            var _local_7:int = _local_4.width;
            var _local_8:int = _local_7;
            var _local_9:int;
            var _local_10:uint;
            while (_local_10 < _local_5)
            {
                _local_12 = this._stringArray[_local_10];
                if (_local_12.length > _Str_15603)
                {
                    _local_12 = (_local_12.substring(0, _Str_15603) + "...");
                }
                _local_6 = (context.create((((name + "::menuItem[") + _local_10) + "]"), _local_12, WindowType.WINDOW_TYPE_DROPMENU_ITEM, _style, ((((WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_FIXED | WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_FIXED) | WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT) | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR) | WindowParam.WINDOW_PARAM_NULL), null, _arg_3, null, _local_10, null, "", [WindowController.TAG_EXCLUDE]) as DropMenuItemController);
                _Str_3139.push(_local_6);
                _local_8 = Math.max(_local_8, _local_6.width);
                _local_9 = (_local_9 + _local_6.height);
                _local_6.width = _local_7;
                _local_4.addListItem(_local_6);
                _local_10++;
            }
            if (_local_8 > _local_7)
            {
                _arg_2.width = (_arg_2.width + (_local_8 - _local_4.width));
                _local_10 = 0;
                while (_local_10 < _local_5)
                {
                    _local_4.getListItemAt(_local_10).width = _local_8;
                    _local_10++;
                }
            }
            var _local_11:IWindow = context.create((name + "::padding"), "", WindowType.WINDOW_TYPE_CONTAINER, _style, (((WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_FIXED | WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_FIXED) | WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT) | WindowParam.WINDOW_PARAM_NULL), new Rectangle(0, 0, 1, 3), null, null, 0, null, "", [WindowController.TAG_EXCLUDE]);
            _local_4.addListItem(_local_11);
            _local_4.autoArrangeItems = true;
            _local_9 = (_local_9 + _local_11.height);
            _local_9 = (_local_9 + (_local_4.spacing * _local_4.numListItems));
            _arg_2.height = Math.max(_arg_2.height, (_local_9 + 4));
            _Str_18287(_arg_2);
            _arg_2.activate();
            _local_4.height = Math.max(_local_4.height, (_arg_2.height - 4));
            if (((_Str_3371 > -1) && (_local_5)))
            {
                _local_4.getListItemAt(_Str_3371).setStateFlag(WindowState.SELECTED, true);
            }
        }

        override protected function closeExpandedMenuView():void
        {
            var k:ILabelWindow;
            if (close())
            {
                if (_Str_3565 != null)
                {
                    _Str_3565.destroy();
                    _Str_3565 = null;
                }
                _Str_3943 = false;
                while (_Str_3139.length > 0)
                {
                    _Str_3139.pop().dispose();
                }
                if (!disposed)
                {
                    k = _Str_9315();
                    k.visible = true;
                    if (k)
                    {
                        k.text = (((_Str_3371 < this._stringArray.length) && (_Str_3371 > -1)) ? this._stringArray[_Str_3371] : caption);
                    }
                }
            }
        }

        public function _Str_4487():Array
        {
            var _local_2:int;
            var k:Array = [];
            if (!_disposed)
            {
                _local_2 = 0;
                while (_local_2 < this._stringArray.length)
                {
                    k.push(this._stringArray[_local_2]);
                    _local_2++;
                }
            }
            return k;
        }

        override public function get numMenuItems():int
        {
            return this._stringArray.length;
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            k.push(createProperty(PropertyKeys.MENU_ITEM_ARRAY, this._stringArray));
            return k;
        }

        override public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case PropertyKeys.MENU_ITEM_ARRAY:
                        this.populate((_local_2.value as Array));
                        break;
                }
            }
            super.properties = k;
        }
    }
}
