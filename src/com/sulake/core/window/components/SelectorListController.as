package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.PropertyStruct;

    public class SelectorListController extends SelectorController implements ISelectorListWindow 
    {
        protected var _Str_2981:int = 0;
        private var _Str_12981:Boolean = false;
        private var _vertical:Boolean;

        public function SelectorListController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            _Str_16599 = false;
        }

        public function get spacing():int
        {
            return this._Str_2981;
        }

        public function set spacing(k:int):void
        {
            this._Str_2981 = k;
            this._Str_11558();
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_CHILD_ADDED)
            {
                this._Str_11558();
            }
            else
            {
                if (_arg_2.type == WindowEvent.WINDOW_EVENT_CHILD_RESIZED)
                {
                    this._Str_11558();
                }
                else
                {
                    if (_arg_2.type == WindowEvent.WINDOW_EVENT_CHILD_RELOCATED)
                    {
                        this._Str_11558();
                    }
                }
            }
            return super.update(k, _arg_2);
        }

        private function _Str_11558():void
        {
            var _local_2:IWindow;
            var _local_4:uint;
            if (this._Str_12981)
            {
                return;
            }
            this._Str_12981 = true;
            var k:uint = numSelectables;
            var _local_3:int;
            _local_4 = 0;
            while (_local_4 < k)
            {
                _local_2 = getSelectableAt(_local_4);
                if (this._vertical)
                {
                    _local_2.y = _local_3;
                    _local_3 = (_local_3 + (_local_2.height + this._Str_2981));
                }
                else
                {
                    _local_2.x = _local_3;
                    _local_3 = (_local_3 + (_local_2.width + this._Str_2981));
                }
                _local_4++;
            }
            this._Str_12981 = false;
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            k.push(createProperty(PropertyKeys.SPACING, this._Str_2981));
            k.push(createProperty(PropertyKeys.VERTICAL, this._vertical));
            return k;
        }

        override public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case PropertyKeys.SPACING:
                        if (_local_2.value != this._Str_2981)
                        {
                            this.spacing = (_local_2.value as int);
                        }
                        break;
                    case PropertyKeys.VERTICAL:
                        if (_local_2.value != this._vertical)
                        {
                            this.vertical = (_local_2.value as Boolean);
                        }
                        break;
                }
            }
            super.properties = k;
        }

        public function get vertical():Boolean
        {
            return this._vertical;
        }

        public function set vertical(k:Boolean):void
        {
            this._vertical = k;
            this._Str_11558();
        }
    }
}
