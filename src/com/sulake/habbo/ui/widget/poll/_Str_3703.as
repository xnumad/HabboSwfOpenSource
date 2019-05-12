package com.sulake.habbo.ui.widget.poll
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;

    public class _Str_3703 implements IDisposable 
    {
        private var _id:int = -1;
        private var _roomPollWidget:RoomPollWidget;
        private var _Str_6080:_Str_7707;
        private var _Str_5663:_Str_7707;
        private var _Str_4781:String = "";
        private var _disposed:Boolean = false;

        public function _Str_3703(k:int, _arg_2:RoomPollWidget)
        {
            this._id = k;
            this._roomPollWidget = _arg_2;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            if (this._Str_6080 != null)
            {
                this._Str_6080.dispose();
                this._Str_6080 = null;
            }
            if (this._Str_5663 != null)
            {
                this._Str_5663.dispose();
                this._Str_5663 = null;
            }
            this._roomPollWidget = null;
            this._disposed = true;
        }

        public function _Str_6059(k:String, _arg_2:String):void
        {
            this._Str_22133();
            this._Str_6080 = new _Str_9350(this._id, k, _arg_2, this._roomPollWidget);
            this._Str_6080.start();
        }

        public function _Str_22133():void
        {
            if ((this._Str_6080 is _Str_9350))
            {
                if (!this._Str_6080.disposed)
                {
                    this._Str_6080.dispose();
                }
                this._Str_6080 = null;
            }
        }

        public function _Str_24948(k:String, _arg_2:String, _arg_3:Array, _arg_4:Boolean):void
        {
            this._Str_22133();
            this._Str_25482();
            this._Str_4781 = _arg_2;
            this._Str_5663 = new PollContentDialog(this._id, k, _arg_3, this._roomPollWidget, _arg_4);
            this._Str_5663.start();
        }

        public function _Str_25482():void
        {
            if ((this._Str_5663 is PollContentDialog))
            {
                if (!this._Str_5663.disposed)
                {
                    this._Str_5663.dispose();
                }
                this._Str_5663 = null;
            }
        }

        public function _Str_24541():void
        {
            this._roomPollWidget.windowManager.alert("${poll_thanks_title}", this._Str_4781, 0, function (k:_Str_2418, _arg_2:WindowEvent):void
            {
                k.dispose();
            });
        }
    }
}
