package com.sulake.habbo.window.widgets
{
    import flash.utils.Dictionary;

    public class WidgetClasses 
    {
        public static var _Str_3059:Dictionary = new Dictionary();
        public static var _Str_10619:Array = [];
        private static var key:String;

        {
            _Str_3059[AvatarImageWidget.AVATAR_IMAGE] = AvatarImageWidget;
            _Str_3059[BadgeImageWidget.BADGE_IMAGE] = BadgeImageWidget;
            _Str_3059[BalloonWidget.BALLOON] = BalloonWidget;
            _Str_3059[CountdownWidget.COUNTDOWN] = CountdownWidget;
            _Str_3059[HoverBitmapWidget.HOVER_BITMAP] = HoverBitmapWidget;
            _Str_3059[IlluminaBorderWidget.ILLUMINA_BORDER] = IlluminaBorderWidget;
            _Str_3059[IlluminaChatBubbleWidget.ILLUMINA_CHAT_BUBBLE] = IlluminaChatBubbleWidget;
            _Str_3059[IlluminaInputWidget.ILLUMINA_INPUT] = IlluminaInputWidget;
            _Str_3059[ProgressIndicatorWidget.PROGRESS_INDICATOR] = ProgressIndicatorWidget;
            _Str_3059[LimitedItemOverlayGridWidget.LIMITED_ITEM_OVERLAY_GRID] = LimitedItemOverlayGridWidget;
            _Str_3059[LimitedItemOverlayPreviewWidget.LIMITED_ITEM_OVERLAY_PREVIEW] = LimitedItemOverlayPreviewWidget;
            _Str_3059[LimitedItemOverlaySupplyWidget.LIMITED_ITEM_OVERLAY_SUPPLY] = LimitedItemOverlaySupplyWidget;
            _Str_3059[RarityItemOverlayGridWidget.RARITY_ITEM_OVERLAY_GRID] = RarityItemOverlayGridWidget;
            _Str_3059[RarityItemOverlayPreviewWidget.RARITY_ITEM_OVERLAY_PREVIEW] = RarityItemOverlayPreviewWidget;
            _Str_3059[SeperatorWidget.SEPARATOR] = SeperatorWidget;
            _Str_3059[UpdatingTimestampWidget.UPDATING_TIMESTAMP] = UpdatingTimestampWidget;
            _Str_3059[RunningNumberWidget.RUNNING_NUMBER] = RunningNumberWidget;
            _Str_3059[PetImageWidget.PET_IMAGE] = PetImageWidget;
            _Str_3059[FurnitureImageWidget.FURNITURE_IMAGE] = FurnitureImageWidget;
            _Str_3059[RoomPreviewerWidget.ROOM_PREVIEWER] = RoomPreviewerWidget;
            _Str_3059[PixelLimitWidget.PIXEL_LIMIT] = PixelLimitWidget;
            _Str_3059[RoomThumbnailWidget.ROOM_THUMBNAIL] = RoomThumbnailWidget;
            _Str_3059[RoomUserCountWidget.ROOM_USER_COUNT] = RoomUserCountWidget;
            for (key in _Str_3059)
            {
                _Str_10619.push(key);
            }
            _Str_10619.sort();
        }
    }
}
