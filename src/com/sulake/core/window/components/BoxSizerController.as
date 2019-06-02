package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.PropertyStruct;

    public class BoxSizerController extends ContainerController implements IBoxSizerWindow 
    {
        private var _spacing:int = 5;
        private var _horizontalPadding:int = 8;
        private var _verticalPadding:int = 8;
        private var _vertical:Boolean = false;
        private var _autoArrange:Boolean = true;

        public function BoxSizerController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            switch (_arg_2.type)
            {
                case WindowEvent.WINDOW_EVENT_CHILD_RELOCATED:
                case WindowEvent.WINDOW_EVENT_CHILD_REMOVED:
                case WindowEvent.WINDOW_EVENT_CHILD_ADDED:
                case WindowEvent.WINDOW_EVENT_CHILD_RESIZED:
                case WindowEvent.WINDOW_EVENT_RESIZED:
                case WindowEvent.WINDOW_EVENT_CHILD_VISIBILITY:
                    this._Str_7516();
                    break;
            }
            return super.update(k, _arg_2);
        }

        private function _Str_7516():void
        {
            var _local_2:IWindow;
            if (!this._autoArrange)
            {
                return;
            }
            var k:IWindow;
            var _local_3:int = this._Str_22835();
            var _local_4:int = this._Str_22917();
            if (!this._vertical)
            {
                for each (_local_2 in _Str_2187)
                {
                    if (_local_2.visible)
                    {
                        if (!k)
                        {
                            _local_2.x = this._horizontalPadding;
                        }
                        else
                        {
                            _local_2.x = ((k.x + k.width) + this._spacing);
                        }
                        _local_2.y = this._verticalPadding;
                        if (this._Str_9056(_local_2) > 0)
                        {
                            _local_2.width = ((_local_3 * this._Str_9056(_local_2)) / _local_4);
                        }
                        k = _local_2;
                    }
                }
            }
            else
            {
                for each (_local_2 in _Str_2187)
                {
                    if (_local_2.visible)
                    {
                        if (!k)
                        {
                            _local_2.y = this._verticalPadding;
                        }
                        else
                        {
                            _local_2.y = ((k.y + k.height) + this._spacing);
                        }
                        _local_2.x = this._horizontalPadding;
                        if (this._Str_9056(_local_2) > 0)
                        {
                            _local_2.height = ((_local_3 * this._Str_9056(_local_2)) / _local_4);
                        }
                        k = _local_2;
                    }
                }
            }
        }

        private function _Str_9056(k:IWindow):int
        {
            var _local_3:String;
            var _local_2:int;
            var _local_4:int;
            while (_local_4 < k.tags.length)
            {
                _local_3 = k.tags[_local_4];
                if (_local_3.indexOf("relative") != -1)
                {
                    _local_2 = int(_local_3.slice((_local_3.indexOf("(") + 1), _local_3.indexOf(")")));
                    if (_local_2 < 0)
                    {
                        _local_2 = 0;
                    }
                    k.tags.splice(_local_4, 1, (("relative(" + _local_2) + ")"));
                }
                _local_4++;
            }
            return _local_2;
        }

        private function _Str_22917():int
        {
            var _local_2:IWindow;
            var k:int;
            for each (_local_2 in _Str_2187)
            {
                if (_local_2.visible)
                {
                    k = (k + this._Str_9056(_local_2));
                }
            }
            return k;
        }

        private function _Str_22835():int
        {
            var _local_2:IWindow;
            var k:int = ((this._vertical) ? (this.height - (this._verticalPadding * 2)) : (this.width - (this._horizontalPadding * 2)));
            for each (_local_2 in _Str_2187)
            {
                if (_local_2.visible != false)
                {
                    if (this._Str_9056(_local_2) == 0)
                    {
                        if (this._vertical)
                        {
                            k = (k - (_local_2.height + this._spacing));
                        }
                        else
                        {
                            k = (k - (_local_2.width + this._spacing));
                        }
                    }
                    else
                    {
                        k = (k - this._spacing);
                    }
                }
            }
            return k + this._spacing;
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            k.push(createProperty(PropertyKeys.SPACING, this._spacing));
            k.push(createProperty(PropertyKeys.VERTICAL, this._vertical));
            k.push(createProperty(PropertyKeys.PADDING_HORIZONTAL, this._horizontalPadding));
            k.push(createProperty(PropertyKeys.PADDING_VERTICAL, this._verticalPadding));
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
                        this._spacing = (_local_2.value as int);
                        break;
                    case PropertyKeys.PADDING_HORIZONTAL:
                        this._horizontalPadding = (_local_2.value as int);
                        break;
                    case PropertyKeys.PADDING_VERTICAL:
                        this._verticalPadding = (_local_2.value as int);
                        break;
                    case PropertyKeys.VERTICAL:
                        this._vertical = (_local_2.value as Boolean);
                        break;
                }
            }
            super.properties = k;
            this._Str_7516();
        }

        public function _Str_22450(k:int):void
        {
            this._horizontalPadding = k;
            this._Str_7516();
        }

        public function _Str_24158(k:int):void
        {
            this._verticalPadding = k;
            this._Str_7516();
        }

        public function _Str_9915(k:int):void
        {
            this._spacing = k;
            this._Str_7516();
        }

        public function _Str_25833(k:Boolean):void
        {
            this._vertical = k;
            this._Str_7516();
        }

        public function _Str_18113(k:Boolean):void
        {
            this._autoArrange = k;
            if (k)
            {
                this._Str_7516();
            }
        }

        public function _Str_22747():Boolean
        {
            return this._autoArrange;
        }
    }
}
