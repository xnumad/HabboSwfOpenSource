package com.sulake.habbo.avatar.wardrobe
{
    import com.sulake.habbo.avatar.IOutfit;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.habbo.avatar.figuredata.FigureData;
    import flash.display.BitmapData;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.habbo.avatar.figuredata.FigureDataView;

    public class Outfit implements IOutfit, IAvatarImageListener 
    {
        private var _controller:HabboAvatarEditor;
        private var _figure:String;
        private var _gender:String;
        private var _view:_Str_7647;
        private var _isDisposed:Boolean;

        public function Outfit(k:HabboAvatarEditor, _arg_2:String, _arg_3:String)
        {
            this._controller = k;
            this._view = new _Str_7647(k.manager.windowManager, k.manager.assets, (!(_arg_2 == "")));
            switch (_arg_3)
            {
                case FigureData.M:
                case "m":
                case "M":
                    _arg_3 = FigureData.M;
                    break;
                case FigureData.F:
                case "f":
                case "F":
                    _arg_3 = FigureData.F;
                    break;
            }
            this._figure = _arg_2;
            this._gender = _arg_3;
            this.update();
        }

        public function dispose():void
        {
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
            this._figure = null;
            this._gender = null;
            this._isDisposed = true;
            this._controller = null;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function update():void
        {
            var _local_3:BitmapData;
            var k:Boolean = this._controller.manager.getBoolean("zoom.enabled");
            var _local_2:IAvatarImage = this._controller.manager.avatarRenderManager.createAvatarImage(this.figure, ((k) ? AvatarScaleType.LARGE : AvatarScaleType.SMALL), this._gender, this);
            if (_local_2)
            {
                _local_2.setDirection(AvatarSetType.FULL, FigureDataView._Str_9887);
                _local_3 = _local_2.getImage(AvatarSetType.FULL, true, ((k) ? 0.5 : 1));
                if (((this._view) && (_local_3)))
                {
                    this._view._Str_25268(_local_3);
                }
                _local_2.dispose();
            }
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get gender():String
        {
            return this._gender;
        }

        public function get view():_Str_7647
        {
            return this._view;
        }

        public function _Str_840(k:String):void
        {
            this.update();
        }
    }
}
