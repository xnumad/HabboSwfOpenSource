package com.sulake.habbo.ui.widget.messages
{
    import com.sulake.core.window.IWindowContainer;

    public class RoomWidgetAvatarEditorMessage extends RoomWidgetMessage 
    {
        public static const RWCM_OPEN_AVATAR_EDITOR:String = "RWCM_OPEN_AVATAR_EDITOR";
        public static const RWCM_GET_WARDROBE:String = "RWCM_GET_WARDROBE";
        public static const RWAEM_AVATAR_EDITOR_VIEW_DISPOSED:String = "RWAEM_AVATAR_EDITOR_VIEW_DISPOSED";

        private var _context:IWindowContainer;

        public function RoomWidgetAvatarEditorMessage(k:String, _arg_2:IWindowContainer=null)
        {
            super(k);
            this._context = _arg_2;
        }

        public function get context():IWindowContainer
        {
            return this._context;
        }
    }
}
