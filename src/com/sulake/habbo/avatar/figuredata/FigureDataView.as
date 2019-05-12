package com.sulake.habbo.avatar.figuredata
{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.window.widgets._Str_4709;
    import _Str_425._Str_3172;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
	import com.sulake.habbo.avatar.figuredata.FigureData;

    public class FigureDataView implements IAvatarImageListener 
    {
        public static const _Str_9887:int = 4;

        private var _widget:_Str_4709;
        private var _roomPreviewer:_Str_3172;
        private var _model:FigureData;
        private var _figureString:String;
        private var _isDisposed:Boolean;

        public function FigureDataView(k:FigureData)
        {
            this._model = k;
            this._widget = (k.avatarEditor.view._Str_25244().widget as _Str_4709);
            this._roomPreviewer = this._widget._Str_26451;
            this._roomPreviewer._Str_11035(false, false);
        }

        public function update(k:String, _arg_2:int=0, _arg_3:int=4):void
        {
            var _local_4:IAvatarImage;
            this._figureString = k;
            if (this._roomPreviewer._Str_2949)
            {
                this._roomPreviewer._Str_18705(k, _arg_2);
                this._roomPreviewer._Str_25062(_arg_3, _arg_3);
                this._roomPreviewer._Str_9695(true);
                this._roomPreviewer._Str_22348();
            }
            else
            {
                _local_4 = this._model.avatarEditor.manager.avatarRenderManager.createAvatarImage(k, AvatarScaleType.LARGE, null, this);
                this._widget._Str_9202(_local_4._Str_818(AvatarSetType.FULL));
            }
        }

        public function _Str_840(k:String):void
        {
            var _local_2:IAvatarImage;
            if (k == this._figureString)
            {
                _local_2 = this._model.avatarEditor.manager.avatarRenderManager.createAvatarImage(this._figureString, AvatarScaleType.LARGE, null, this);
                this._widget._Str_9202(_local_2._Str_818(AvatarSetType.FULL));
            }
        }

        public function dispose():void
        {
            this._isDisposed = true;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }
    }
}

