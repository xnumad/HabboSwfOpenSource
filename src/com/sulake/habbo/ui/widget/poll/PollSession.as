package com.sulake.habbo.ui.widget.poll
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.core.window.events.WindowEvent;

    public class PollSession implements IDisposable
    {
        private var _id:int = -1;
        private var _roomPollWidget:RoomPollWidget;
        private var _pollDialog:IPollDialog;
        private var _pollContentDialog:IPollDialog;
        private var _endMessage:String = "";
        private var _disposed:Boolean = false;

        public function PollSession(k:int, _arg_2:RoomPollWidget)
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
            if (this._pollDialog != null)
            {
                this._pollDialog.dispose();
                this._pollDialog = null;
            }
            if (this._pollContentDialog != null)
            {
                this._pollContentDialog.dispose();
                this._pollContentDialog = null;
            }
            this._roomPollWidget = null;
            this._disposed = true;
        }

        public function _Str_6059(k:String, _arg_2:String):void
        {
            this._Str_22133();
            this._pollDialog = new PollOfferDialog(this._id, k, _arg_2, this._roomPollWidget);
            this._pollDialog.start();
        }

        public function _Str_22133():void
        {
            if ((this._pollDialog is PollOfferDialog))
            {
                if (!this._pollDialog.disposed)
                {
                    this._pollDialog.dispose();
                }
                this._pollDialog = null;
            }
        }

        public function _Str_24948(k:String, _arg_2:String, _arg_3:Array, _arg_4:Boolean):void
        {
            this._Str_22133();
            this._Str_25482();
            this._endMessage = _arg_2;
            this._pollContentDialog = new PollContentDialog(this._id, k, _arg_3, this._roomPollWidget, _arg_4);
            this._pollContentDialog.start();
        }

        public function _Str_25482():void
        {
            if ((this._pollContentDialog is PollContentDialog))
            {
                if (!this._pollContentDialog.disposed)
                {
                    this._pollContentDialog.dispose();
                }
                this._pollContentDialog = null;
            }
        }

        public function _Str_24541():void
        {
            this._roomPollWidget.windowManager.alert("${poll_thanks_title}", this._endMessage, 0, function (k:IAlertDialog, _arg_2:WindowEvent):void
            {
                k.dispose();
            });
        }
    }
}
