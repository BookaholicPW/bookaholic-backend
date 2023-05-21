package pw.bookaholic.chatMessage;

import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ChatMessageMapper {

    ChatMessage chatMessageDtoToChatMessage(ChatMessageDTO chatMessageDTO);

    ChatMessageDTO chatMessageToChatMessageDto(ChatMessage chatMessage);

}
