package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.enum.Direction;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.PropertyStruct;

    public class BubbleController extends FrameController implements IBubbleWindow 
    {
        private static const _POINTER_UP:String = "_POINTER_UP";
        private static const _POINTER_DOWN:String = "_POINTER_DOWN";
        private static const _POINTER_LEFT:String = "_POINTER_LEFT";
        private static const _POINTER_RIGHT:String = "_POINTER_RIGHT";

        private var _direction:String = "down";
        private var _pointerOffset:int = 0;

        public function BubbleController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        public function get direction():String
        {
            return this._direction;
        }

        public function set direction(k:String):void
        {
            var _local_2:IWindow;
            if (k != this._direction)
            {
                _local_2 = getChildByName(k);
                if (!_local_2)
                {
                    throw (new Error((('Invalid pointer direction: "' + k) + '"!')));
                }
                getChildByName(this._direction).visible = false;
                _local_2.visible = true;
                this._direction = k;
                this._Str_8006 = this._pointerOffset;
            }
        }

        public function get _Str_8006():int
        {
            return this._pointerOffset;
        }

        public function set _Str_8006(k:int):void
        {
            var _local_2:IWindow = getChildByName(this._direction);
            if (!_local_2)
            {
                throw (new Error((('Invalid pointer direction: "' + this._direction) + '"!')));
            }
            if (((this._direction == Direction.UP) || (this._direction == Direction.DOWN)))
            {
                _local_2.x = ((width / 2) + k);
            }
            else
            {
                _local_2.y = ((height / 2) + k);
            }
            this._pointerOffset = k;
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            var _local_3:Boolean = super.update(k, _arg_2);
            if (this._pointerOffset != 0)
            {
                if (k == this)
                {
                    if (_arg_2.type == WindowEvent.WINDOW_EVENT_RESIZED)
                    {
                        this._Str_8006 = this._pointerOffset;
                    }
                }
            }
            return _local_3;
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            k.push(createProperty(PropertyKeys.DIRECTION, this._direction));
            k.push(createProperty(PropertyKeys.POINTER_OFFSET, this._pointerOffset));
            return k;
        }

        override public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case PropertyKeys.DIRECTION:
                        this.direction = (_local_2.value as String);
                        break;
                    case PropertyKeys.POINTER_OFFSET:
                        this._Str_8006 = (_local_2.value as int);
                        break;
                }
            }
            super.properties = k;
        }
    }
}
