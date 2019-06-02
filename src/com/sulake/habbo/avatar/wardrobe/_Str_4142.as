package com.sulake.habbo.avatar.wardrobe
{
    import com.sulake.habbo.avatar.IOutfit;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.avatar.figuredata.FigureData;
    import flash.display.BitmapData;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.habbo.avatar.figuredata.FigureDataView;
    import flash.geom.Matrix;
    import com.sulake.core.window.components.IContainerButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class _Str_4142 implements IOutfit, IAvatarImageListener 
    {
        private var _habboAvatarEditor:HabboAvatarEditor;
        private var _figure:String;
        private var _gender:String;
        private var _Str_3886:Boolean;
        private var _view:IWindowContainer;
        private var _Str_5246:IBitmapWrapperWindow;
        private var _id:int;
        private var _disposed:Boolean;

        public function _Str_4142(k:IWindow, _arg_2:HabboAvatarEditor, _arg_3:int, _arg_4:Boolean, _arg_5:String=null, _arg_6:String=null)
        {
            this._habboAvatarEditor = _arg_2;
            this._id = _arg_3;
            this._Str_13142(k);
            this.update(_arg_5, _arg_6, _arg_4);
        }

        public function get id():int
        {
            return this._id;
        }

        public function update(k:String, _arg_2:String, _arg_3:Boolean):void
        {
            switch (_arg_2)
            {
                case FigureData.M:
                case "m":
                case "M":
                    _arg_2 = FigureData.M;
                    break;
                case FigureData.F:
                case "f":
                case "F":
                    _arg_2 = FigureData.F;
                    break;
            }
            this._figure = k;
            this._gender = _arg_2;
            this._Str_3886 = _arg_3;
            this._Str_2491();
        }

        private function _Str_13142(k:IWindow):void
        {
            this._view = (k.clone() as IWindowContainer);
            this._view.procedure = this.eventHandler;
            this._view.visible = false;
            this._Str_5246 = (this._view.findChildByName("image") as IBitmapWrapperWindow);
        }

        public function dispose():void
        {
            this._habboAvatarEditor = null;
            this._figure = null;
            this._gender = null;
            this._Str_5246 = null;
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_2491():void
        {
            var k:BitmapData;
            var _local_6:IAvatarImage;
            var _local_7:BitmapDataAsset;
            var _local_8:int;
            var _local_9:int;
            var _local_2:Boolean = true;
            var _local_3:Boolean = this._habboAvatarEditor.manager.getBoolean("zoom.enabled");
            if (((this._figure) && (this._Str_3886)))
            {
                _local_6 = this._habboAvatarEditor.manager.avatarRenderManager.createAvatarImage(this.figure, ((_local_3) ? AvatarScaleType.LARGE : AvatarScaleType.SMALL), this._gender, this);
                if (_local_6)
                {
                    _local_6.setDirection(AvatarSetType.FULL, FigureDataView._Str_9887);
                    k = _local_6._Str_818(AvatarSetType.FULL, ((_local_3) ? 0.5 : 1));
                    _local_6.dispose();
                }
            }
            else
            {
                _local_7 = (this._habboAvatarEditor.manager.windowManager.assets.getAssetByName("avatar_editor_wardrobe_empty_slot") as BitmapDataAsset);
                if (_local_7)
                {
                    k = (_local_7.content as BitmapData);
                    _local_2 = false;
                }
            }
            if (!k)
            {
                return;
            }
            if (this._Str_5246)
            {
                if (this._Str_5246.bitmap)
                {
                    this._Str_5246.bitmap.dispose();
                }
                this._Str_5246.bitmap = new BitmapData(this._Str_5246.width, this._Str_5246.height, true, 0);
                _local_8 = ((this._Str_5246.width - k.width) / 2);
                _local_9 = ((this._Str_5246.height - k.height) / 2);
                this._Str_5246.bitmap.draw(k, new Matrix(1, 0, 0, 1, _local_8, _local_9));
            }
            if (_local_2)
            {
                k.dispose();
            }
            var _local_4:IContainerButtonWindow = (this._view.findChildByName("set_button") as IContainerButtonWindow);
            if (_local_4)
            {
                _local_4.visible = this._Str_3886;
            }
            var _local_5:IContainerButtonWindow = (this._view.findChildByName("get_button") as IContainerButtonWindow);
            if (_local_5)
            {
                _local_5.visible = ((this._Str_3886) && (!(this._figure == null)));
            }
        }

        private function eventHandler(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (!this._habboAvatarEditor._Str_10922())
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "set_button":
                    this._figure = this._habboAvatarEditor.figureData.getFigureString();
                    this._gender = this._habboAvatarEditor.gender;
                    this._habboAvatarEditor.handler._Str_25374(this._id, this);
                    this._Str_2491();
                    return;
                case "get_button":
                case "get_figure":
                    if (this._figure)
                    {
                        this._habboAvatarEditor.loadAvatarInEditor(this._figure, this._gender, this._habboAvatarEditor.clubMemberLevel);
                    }
                    return;
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

        public function get view():IWindowContainer
        {
            return this._view;
        }

        public function _Str_840(k:String):void
        {
            this._Str_2491();
        }
    }
}



