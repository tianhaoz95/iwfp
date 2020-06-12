import * as $protobuf from "protobufjs";
/** Properties of a CreditCard. */
export interface ICreditCard {
  /** CreditCard id */
  id?: string | null;

  /** CreditCard displayName */
  displayName?: string | null;

  /** CreditCard promotions */
  promotions?: IPromotion[] | null;

  /** CreditCard officialUrl */
  officialUrl?: string | null;
}

/** Represents a CreditCard. */
export class CreditCard implements ICreditCard {
  /**
   * Constructs a new CreditCard.
   * @param [properties] Properties to set
   */
  constructor(properties?: ICreditCard);

  /** CreditCard id. */
  public id: string;

  /** CreditCard displayName. */
  public displayName: string;

  /** CreditCard promotions. */
  public promotions: IPromotion[];

  /** CreditCard officialUrl. */
  public officialUrl: string;

  /**
   * Creates a new CreditCard instance using the specified properties.
   * @param [properties] Properties to set
   * @returns CreditCard instance
   */
  public static create(properties?: ICreditCard): CreditCard;

  /**
   * Encodes the specified CreditCard message. Does not implicitly {@link CreditCard.verify|verify} messages.
   * @param message CreditCard message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encode(
    message: ICreditCard,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Encodes the specified CreditCard message, length delimited. Does not implicitly {@link CreditCard.verify|verify} messages.
   * @param message CreditCard message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encodeDelimited(
    message: ICreditCard,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Decodes a CreditCard message from the specified reader or buffer.
   * @param reader Reader or buffer to decode from
   * @param [length] Message length if known beforehand
   * @returns CreditCard
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decode(
    reader: $protobuf.Reader | Uint8Array,
    length?: number
  ): CreditCard;

  /**
   * Decodes a CreditCard message from the specified reader or buffer, length delimited.
   * @param reader Reader or buffer to decode from
   * @returns CreditCard
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decodeDelimited(
    reader: $protobuf.Reader | Uint8Array
  ): CreditCard;

  /**
   * Verifies a CreditCard message.
   * @param message Plain object to verify
   * @returns `null` if valid, otherwise the reason why it is not
   */
  public static verify(message: { [k: string]: any }): string | null;

  /**
   * Creates a CreditCard message from a plain object. Also converts values to their respective internal types.
   * @param object Plain object
   * @returns CreditCard
   */
  public static fromObject(object: { [k: string]: any }): CreditCard;

  /**
   * Creates a plain object from a CreditCard message. Also converts values to other types if specified.
   * @param message CreditCard
   * @param [options] Conversion options
   * @returns Plain object
   */
  public static toObject(
    message: CreditCard,
    options?: $protobuf.IConversionOptions
  ): { [k: string]: any };

  /**
   * Converts this CreditCard to JSON.
   * @returns JSON object
   */
  public toJSON(): { [k: string]: any };
}

/** Properties of a Promotion. */
export interface IPromotion {
  /** Promotion id */
  id?: string | null;

  /** Promotion displayName */
  displayName?: string | null;

  /** Promotion startDate */
  startDate?: string | null;

  /** Promotion endDate */
  endDate?: string | null;

  /** Promotion type */
  type?: string | null;

  /** Promotion repeatPattern */
  repeatPattern?: string | null;

  /** Promotion rate */
  rate?: number | null;

  /** Promotion category */
  category?: IShoppingCategory | null;
}

/** Represents a Promotion. */
export class Promotion implements IPromotion {
  /**
   * Constructs a new Promotion.
   * @param [properties] Properties to set
   */
  constructor(properties?: IPromotion);

  /** Promotion id. */
  public id: string;

  /** Promotion displayName. */
  public displayName: string;

  /** Promotion startDate. */
  public startDate: string;

  /** Promotion endDate. */
  public endDate: string;

  /** Promotion type. */
  public type: string;

  /** Promotion repeatPattern. */
  public repeatPattern: string;

  /** Promotion rate. */
  public rate: number;

  /** Promotion category. */
  public category?: IShoppingCategory | null;

  /**
   * Creates a new Promotion instance using the specified properties.
   * @param [properties] Properties to set
   * @returns Promotion instance
   */
  public static create(properties?: IPromotion): Promotion;

  /**
   * Encodes the specified Promotion message. Does not implicitly {@link Promotion.verify|verify} messages.
   * @param message Promotion message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encode(
    message: IPromotion,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Encodes the specified Promotion message, length delimited. Does not implicitly {@link Promotion.verify|verify} messages.
   * @param message Promotion message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encodeDelimited(
    message: IPromotion,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Decodes a Promotion message from the specified reader or buffer.
   * @param reader Reader or buffer to decode from
   * @param [length] Message length if known beforehand
   * @returns Promotion
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decode(
    reader: $protobuf.Reader | Uint8Array,
    length?: number
  ): Promotion;

  /**
   * Decodes a Promotion message from the specified reader or buffer, length delimited.
   * @param reader Reader or buffer to decode from
   * @returns Promotion
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decodeDelimited(
    reader: $protobuf.Reader | Uint8Array
  ): Promotion;

  /**
   * Verifies a Promotion message.
   * @param message Plain object to verify
   * @returns `null` if valid, otherwise the reason why it is not
   */
  public static verify(message: { [k: string]: any }): string | null;

  /**
   * Creates a Promotion message from a plain object. Also converts values to their respective internal types.
   * @param object Plain object
   * @returns Promotion
   */
  public static fromObject(object: { [k: string]: any }): Promotion;

  /**
   * Creates a plain object from a Promotion message. Also converts values to other types if specified.
   * @param message Promotion
   * @param [options] Conversion options
   * @returns Plain object
   */
  public static toObject(
    message: Promotion,
    options?: $protobuf.IConversionOptions
  ): { [k: string]: any };

  /**
   * Converts this Promotion to JSON.
   * @returns JSON object
   */
  public toJSON(): { [k: string]: any };
}

/** Properties of a ShoppingCategory. */
export interface IShoppingCategory {
  /** ShoppingCategory id */
  id?: string | null;

  /** ShoppingCategory displayName */
  displayName?: string | null;
}

/** Represents a ShoppingCategory. */
export class ShoppingCategory implements IShoppingCategory {
  /**
   * Constructs a new ShoppingCategory.
   * @param [properties] Properties to set
   */
  constructor(properties?: IShoppingCategory);

  /** ShoppingCategory id. */
  public id: string;

  /** ShoppingCategory displayName. */
  public displayName: string;

  /**
   * Creates a new ShoppingCategory instance using the specified properties.
   * @param [properties] Properties to set
   * @returns ShoppingCategory instance
   */
  public static create(properties?: IShoppingCategory): ShoppingCategory;

  /**
   * Encodes the specified ShoppingCategory message. Does not implicitly {@link ShoppingCategory.verify|verify} messages.
   * @param message ShoppingCategory message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encode(
    message: IShoppingCategory,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Encodes the specified ShoppingCategory message, length delimited. Does not implicitly {@link ShoppingCategory.verify|verify} messages.
   * @param message ShoppingCategory message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encodeDelimited(
    message: IShoppingCategory,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Decodes a ShoppingCategory message from the specified reader or buffer.
   * @param reader Reader or buffer to decode from
   * @param [length] Message length if known beforehand
   * @returns ShoppingCategory
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decode(
    reader: $protobuf.Reader | Uint8Array,
    length?: number
  ): ShoppingCategory;

  /**
   * Decodes a ShoppingCategory message from the specified reader or buffer, length delimited.
   * @param reader Reader or buffer to decode from
   * @returns ShoppingCategory
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decodeDelimited(
    reader: $protobuf.Reader | Uint8Array
  ): ShoppingCategory;

  /**
   * Verifies a ShoppingCategory message.
   * @param message Plain object to verify
   * @returns `null` if valid, otherwise the reason why it is not
   */
  public static verify(message: { [k: string]: any }): string | null;

  /**
   * Creates a ShoppingCategory message from a plain object. Also converts values to their respective internal types.
   * @param object Plain object
   * @returns ShoppingCategory
   */
  public static fromObject(object: { [k: string]: any }): ShoppingCategory;

  /**
   * Creates a plain object from a ShoppingCategory message. Also converts values to other types if specified.
   * @param message ShoppingCategory
   * @param [options] Conversion options
   * @returns Plain object
   */
  public static toObject(
    message: ShoppingCategory,
    options?: $protobuf.IConversionOptions
  ): { [k: string]: any };

  /**
   * Converts this ShoppingCategory to JSON.
   * @returns JSON object
   */
  public toJSON(): { [k: string]: any };
}

/** Properties of a CreditCardCreationRequest. */
export interface ICreditCardCreationRequest {
  /** CreditCardCreationRequest valid */
  valid?: boolean | null;

  /** CreditCardCreationRequest cardData */
  cardData?: ICreditCard | null;
}

/** Represents a CreditCardCreationRequest. */
export class CreditCardCreationRequest implements ICreditCardCreationRequest {
  /**
   * Constructs a new CreditCardCreationRequest.
   * @param [properties] Properties to set
   */
  constructor(properties?: ICreditCardCreationRequest);

  /** CreditCardCreationRequest valid. */
  public valid: boolean;

  /** CreditCardCreationRequest cardData. */
  public cardData?: ICreditCard | null;

  /**
   * Creates a new CreditCardCreationRequest instance using the specified properties.
   * @param [properties] Properties to set
   * @returns CreditCardCreationRequest instance
   */
  public static create(
    properties?: ICreditCardCreationRequest
  ): CreditCardCreationRequest;

  /**
   * Encodes the specified CreditCardCreationRequest message. Does not implicitly {@link CreditCardCreationRequest.verify|verify} messages.
   * @param message CreditCardCreationRequest message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encode(
    message: ICreditCardCreationRequest,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Encodes the specified CreditCardCreationRequest message, length delimited. Does not implicitly {@link CreditCardCreationRequest.verify|verify} messages.
   * @param message CreditCardCreationRequest message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encodeDelimited(
    message: ICreditCardCreationRequest,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Decodes a CreditCardCreationRequest message from the specified reader or buffer.
   * @param reader Reader or buffer to decode from
   * @param [length] Message length if known beforehand
   * @returns CreditCardCreationRequest
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decode(
    reader: $protobuf.Reader | Uint8Array,
    length?: number
  ): CreditCardCreationRequest;

  /**
   * Decodes a CreditCardCreationRequest message from the specified reader or buffer, length delimited.
   * @param reader Reader or buffer to decode from
   * @returns CreditCardCreationRequest
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decodeDelimited(
    reader: $protobuf.Reader | Uint8Array
  ): CreditCardCreationRequest;

  /**
   * Verifies a CreditCardCreationRequest message.
   * @param message Plain object to verify
   * @returns `null` if valid, otherwise the reason why it is not
   */
  public static verify(message: { [k: string]: any }): string | null;

  /**
   * Creates a CreditCardCreationRequest message from a plain object. Also converts values to their respective internal types.
   * @param object Plain object
   * @returns CreditCardCreationRequest
   */
  public static fromObject(object: {
    [k: string]: any;
  }): CreditCardCreationRequest;

  /**
   * Creates a plain object from a CreditCardCreationRequest message. Also converts values to other types if specified.
   * @param message CreditCardCreationRequest
   * @param [options] Conversion options
   * @returns Plain object
   */
  public static toObject(
    message: CreditCardCreationRequest,
    options?: $protobuf.IConversionOptions
  ): { [k: string]: any };

  /**
   * Converts this CreditCardCreationRequest to JSON.
   * @returns JSON object
   */
  public toJSON(): { [k: string]: any };
}

/** Properties of a CreditCardUpdateRequest. */
export interface ICreditCardUpdateRequest {
  /** CreditCardUpdateRequest valid */
  valid?: boolean | null;

  /** CreditCardUpdateRequest updatedCardData */
  updatedCardData?: ICreditCard | null;
}

/** Represents a CreditCardUpdateRequest. */
export class CreditCardUpdateRequest implements ICreditCardUpdateRequest {
  /**
   * Constructs a new CreditCardUpdateRequest.
   * @param [properties] Properties to set
   */
  constructor(properties?: ICreditCardUpdateRequest);

  /** CreditCardUpdateRequest valid. */
  public valid: boolean;

  /** CreditCardUpdateRequest updatedCardData. */
  public updatedCardData?: ICreditCard | null;

  /**
   * Creates a new CreditCardUpdateRequest instance using the specified properties.
   * @param [properties] Properties to set
   * @returns CreditCardUpdateRequest instance
   */
  public static create(
    properties?: ICreditCardUpdateRequest
  ): CreditCardUpdateRequest;

  /**
   * Encodes the specified CreditCardUpdateRequest message. Does not implicitly {@link CreditCardUpdateRequest.verify|verify} messages.
   * @param message CreditCardUpdateRequest message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encode(
    message: ICreditCardUpdateRequest,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Encodes the specified CreditCardUpdateRequest message, length delimited. Does not implicitly {@link CreditCardUpdateRequest.verify|verify} messages.
   * @param message CreditCardUpdateRequest message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encodeDelimited(
    message: ICreditCardUpdateRequest,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Decodes a CreditCardUpdateRequest message from the specified reader or buffer.
   * @param reader Reader or buffer to decode from
   * @param [length] Message length if known beforehand
   * @returns CreditCardUpdateRequest
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decode(
    reader: $protobuf.Reader | Uint8Array,
    length?: number
  ): CreditCardUpdateRequest;

  /**
   * Decodes a CreditCardUpdateRequest message from the specified reader or buffer, length delimited.
   * @param reader Reader or buffer to decode from
   * @returns CreditCardUpdateRequest
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decodeDelimited(
    reader: $protobuf.Reader | Uint8Array
  ): CreditCardUpdateRequest;

  /**
   * Verifies a CreditCardUpdateRequest message.
   * @param message Plain object to verify
   * @returns `null` if valid, otherwise the reason why it is not
   */
  public static verify(message: { [k: string]: any }): string | null;

  /**
   * Creates a CreditCardUpdateRequest message from a plain object. Also converts values to their respective internal types.
   * @param object Plain object
   * @returns CreditCardUpdateRequest
   */
  public static fromObject(object: {
    [k: string]: any;
  }): CreditCardUpdateRequest;

  /**
   * Creates a plain object from a CreditCardUpdateRequest message. Also converts values to other types if specified.
   * @param message CreditCardUpdateRequest
   * @param [options] Conversion options
   * @returns Plain object
   */
  public static toObject(
    message: CreditCardUpdateRequest,
    options?: $protobuf.IConversionOptions
  ): { [k: string]: any };

  /**
   * Converts this CreditCardUpdateRequest to JSON.
   * @returns JSON object
   */
  public toJSON(): { [k: string]: any };
}

/** Properties of a CreditCardRemovalRequest. */
export interface ICreditCardRemovalRequest {
  /** CreditCardRemovalRequest valid */
  valid?: boolean | null;

  /** CreditCardRemovalRequest cardId */
  cardId?: string | null;
}

/** Represents a CreditCardRemovalRequest. */
export class CreditCardRemovalRequest implements ICreditCardRemovalRequest {
  /**
   * Constructs a new CreditCardRemovalRequest.
   * @param [properties] Properties to set
   */
  constructor(properties?: ICreditCardRemovalRequest);

  /** CreditCardRemovalRequest valid. */
  public valid: boolean;

  /** CreditCardRemovalRequest cardId. */
  public cardId: string;

  /**
   * Creates a new CreditCardRemovalRequest instance using the specified properties.
   * @param [properties] Properties to set
   * @returns CreditCardRemovalRequest instance
   */
  public static create(
    properties?: ICreditCardRemovalRequest
  ): CreditCardRemovalRequest;

  /**
   * Encodes the specified CreditCardRemovalRequest message. Does not implicitly {@link CreditCardRemovalRequest.verify|verify} messages.
   * @param message CreditCardRemovalRequest message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encode(
    message: ICreditCardRemovalRequest,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Encodes the specified CreditCardRemovalRequest message, length delimited. Does not implicitly {@link CreditCardRemovalRequest.verify|verify} messages.
   * @param message CreditCardRemovalRequest message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encodeDelimited(
    message: ICreditCardRemovalRequest,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Decodes a CreditCardRemovalRequest message from the specified reader or buffer.
   * @param reader Reader or buffer to decode from
   * @param [length] Message length if known beforehand
   * @returns CreditCardRemovalRequest
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decode(
    reader: $protobuf.Reader | Uint8Array,
    length?: number
  ): CreditCardRemovalRequest;

  /**
   * Decodes a CreditCardRemovalRequest message from the specified reader or buffer, length delimited.
   * @param reader Reader or buffer to decode from
   * @returns CreditCardRemovalRequest
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decodeDelimited(
    reader: $protobuf.Reader | Uint8Array
  ): CreditCardRemovalRequest;

  /**
   * Verifies a CreditCardRemovalRequest message.
   * @param message Plain object to verify
   * @returns `null` if valid, otherwise the reason why it is not
   */
  public static verify(message: { [k: string]: any }): string | null;

  /**
   * Creates a CreditCardRemovalRequest message from a plain object. Also converts values to their respective internal types.
   * @param object Plain object
   * @returns CreditCardRemovalRequest
   */
  public static fromObject(object: {
    [k: string]: any;
  }): CreditCardRemovalRequest;

  /**
   * Creates a plain object from a CreditCardRemovalRequest message. Also converts values to other types if specified.
   * @param message CreditCardRemovalRequest
   * @param [options] Conversion options
   * @returns Plain object
   */
  public static toObject(
    message: CreditCardRemovalRequest,
    options?: $protobuf.IConversionOptions
  ): { [k: string]: any };

  /**
   * Converts this CreditCardRemovalRequest to JSON.
   * @returns JSON object
   */
  public toJSON(): { [k: string]: any };
}

/** Properties of a PromotionAdditionRequest. */
export interface IPromotionAdditionRequest {
  /** PromotionAdditionRequest valid */
  valid?: boolean | null;

  /** PromotionAdditionRequest targetCardId */
  targetCardId?: string | null;

  /** PromotionAdditionRequest promotionData */
  promotionData?: IPromotion | null;
}

/** Represents a PromotionAdditionRequest. */
export class PromotionAdditionRequest implements IPromotionAdditionRequest {
  /**
   * Constructs a new PromotionAdditionRequest.
   * @param [properties] Properties to set
   */
  constructor(properties?: IPromotionAdditionRequest);

  /** PromotionAdditionRequest valid. */
  public valid: boolean;

  /** PromotionAdditionRequest targetCardId. */
  public targetCardId: string;

  /** PromotionAdditionRequest promotionData. */
  public promotionData?: IPromotion | null;

  /**
   * Creates a new PromotionAdditionRequest instance using the specified properties.
   * @param [properties] Properties to set
   * @returns PromotionAdditionRequest instance
   */
  public static create(
    properties?: IPromotionAdditionRequest
  ): PromotionAdditionRequest;

  /**
   * Encodes the specified PromotionAdditionRequest message. Does not implicitly {@link PromotionAdditionRequest.verify|verify} messages.
   * @param message PromotionAdditionRequest message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encode(
    message: IPromotionAdditionRequest,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Encodes the specified PromotionAdditionRequest message, length delimited. Does not implicitly {@link PromotionAdditionRequest.verify|verify} messages.
   * @param message PromotionAdditionRequest message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encodeDelimited(
    message: IPromotionAdditionRequest,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Decodes a PromotionAdditionRequest message from the specified reader or buffer.
   * @param reader Reader or buffer to decode from
   * @param [length] Message length if known beforehand
   * @returns PromotionAdditionRequest
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decode(
    reader: $protobuf.Reader | Uint8Array,
    length?: number
  ): PromotionAdditionRequest;

  /**
   * Decodes a PromotionAdditionRequest message from the specified reader or buffer, length delimited.
   * @param reader Reader or buffer to decode from
   * @returns PromotionAdditionRequest
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decodeDelimited(
    reader: $protobuf.Reader | Uint8Array
  ): PromotionAdditionRequest;

  /**
   * Verifies a PromotionAdditionRequest message.
   * @param message Plain object to verify
   * @returns `null` if valid, otherwise the reason why it is not
   */
  public static verify(message: { [k: string]: any }): string | null;

  /**
   * Creates a PromotionAdditionRequest message from a plain object. Also converts values to their respective internal types.
   * @param object Plain object
   * @returns PromotionAdditionRequest
   */
  public static fromObject(object: {
    [k: string]: any;
  }): PromotionAdditionRequest;

  /**
   * Creates a plain object from a PromotionAdditionRequest message. Also converts values to other types if specified.
   * @param message PromotionAdditionRequest
   * @param [options] Conversion options
   * @returns Plain object
   */
  public static toObject(
    message: PromotionAdditionRequest,
    options?: $protobuf.IConversionOptions
  ): { [k: string]: any };

  /**
   * Converts this PromotionAdditionRequest to JSON.
   * @returns JSON object
   */
  public toJSON(): { [k: string]: any };
}

/** Properties of a PromotionRemovalRequest. */
export interface IPromotionRemovalRequest {
  /** PromotionRemovalRequest valid */
  valid?: boolean | null;

  /** PromotionRemovalRequest targetCardId */
  targetCardId?: string | null;

  /** PromotionRemovalRequest targetPromotionId */
  targetPromotionId?: string | null;
}

/** Represents a PromotionRemovalRequest. */
export class PromotionRemovalRequest implements IPromotionRemovalRequest {
  /**
   * Constructs a new PromotionRemovalRequest.
   * @param [properties] Properties to set
   */
  constructor(properties?: IPromotionRemovalRequest);

  /** PromotionRemovalRequest valid. */
  public valid: boolean;

  /** PromotionRemovalRequest targetCardId. */
  public targetCardId: string;

  /** PromotionRemovalRequest targetPromotionId. */
  public targetPromotionId: string;

  /**
   * Creates a new PromotionRemovalRequest instance using the specified properties.
   * @param [properties] Properties to set
   * @returns PromotionRemovalRequest instance
   */
  public static create(
    properties?: IPromotionRemovalRequest
  ): PromotionRemovalRequest;

  /**
   * Encodes the specified PromotionRemovalRequest message. Does not implicitly {@link PromotionRemovalRequest.verify|verify} messages.
   * @param message PromotionRemovalRequest message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encode(
    message: IPromotionRemovalRequest,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Encodes the specified PromotionRemovalRequest message, length delimited. Does not implicitly {@link PromotionRemovalRequest.verify|verify} messages.
   * @param message PromotionRemovalRequest message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encodeDelimited(
    message: IPromotionRemovalRequest,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Decodes a PromotionRemovalRequest message from the specified reader or buffer.
   * @param reader Reader or buffer to decode from
   * @param [length] Message length if known beforehand
   * @returns PromotionRemovalRequest
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decode(
    reader: $protobuf.Reader | Uint8Array,
    length?: number
  ): PromotionRemovalRequest;

  /**
   * Decodes a PromotionRemovalRequest message from the specified reader or buffer, length delimited.
   * @param reader Reader or buffer to decode from
   * @returns PromotionRemovalRequest
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decodeDelimited(
    reader: $protobuf.Reader | Uint8Array
  ): PromotionRemovalRequest;

  /**
   * Verifies a PromotionRemovalRequest message.
   * @param message Plain object to verify
   * @returns `null` if valid, otherwise the reason why it is not
   */
  public static verify(message: { [k: string]: any }): string | null;

  /**
   * Creates a PromotionRemovalRequest message from a plain object. Also converts values to their respective internal types.
   * @param object Plain object
   * @returns PromotionRemovalRequest
   */
  public static fromObject(object: {
    [k: string]: any;
  }): PromotionRemovalRequest;

  /**
   * Creates a plain object from a PromotionRemovalRequest message. Also converts values to other types if specified.
   * @param message PromotionRemovalRequest
   * @param [options] Conversion options
   * @returns Plain object
   */
  public static toObject(
    message: PromotionRemovalRequest,
    options?: $protobuf.IConversionOptions
  ): { [k: string]: any };

  /**
   * Converts this PromotionRemovalRequest to JSON.
   * @returns JSON object
   */
  public toJSON(): { [k: string]: any };
}

/** Properties of a PromotionUpdateRequest. */
export interface IPromotionUpdateRequest {
  /** PromotionUpdateRequest targetCardId */
  targetCardId?: string | null;

  /** PromotionUpdateRequest updatedPromotionData */
  updatedPromotionData?: IPromotion | null;
}

/** Represents a PromotionUpdateRequest. */
export class PromotionUpdateRequest implements IPromotionUpdateRequest {
  /**
   * Constructs a new PromotionUpdateRequest.
   * @param [properties] Properties to set
   */
  constructor(properties?: IPromotionUpdateRequest);

  /** PromotionUpdateRequest targetCardId. */
  public targetCardId: string;

  /** PromotionUpdateRequest updatedPromotionData. */
  public updatedPromotionData?: IPromotion | null;

  /**
   * Creates a new PromotionUpdateRequest instance using the specified properties.
   * @param [properties] Properties to set
   * @returns PromotionUpdateRequest instance
   */
  public static create(
    properties?: IPromotionUpdateRequest
  ): PromotionUpdateRequest;

  /**
   * Encodes the specified PromotionUpdateRequest message. Does not implicitly {@link PromotionUpdateRequest.verify|verify} messages.
   * @param message PromotionUpdateRequest message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encode(
    message: IPromotionUpdateRequest,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Encodes the specified PromotionUpdateRequest message, length delimited. Does not implicitly {@link PromotionUpdateRequest.verify|verify} messages.
   * @param message PromotionUpdateRequest message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encodeDelimited(
    message: IPromotionUpdateRequest,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Decodes a PromotionUpdateRequest message from the specified reader or buffer.
   * @param reader Reader or buffer to decode from
   * @param [length] Message length if known beforehand
   * @returns PromotionUpdateRequest
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decode(
    reader: $protobuf.Reader | Uint8Array,
    length?: number
  ): PromotionUpdateRequest;

  /**
   * Decodes a PromotionUpdateRequest message from the specified reader or buffer, length delimited.
   * @param reader Reader or buffer to decode from
   * @returns PromotionUpdateRequest
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decodeDelimited(
    reader: $protobuf.Reader | Uint8Array
  ): PromotionUpdateRequest;

  /**
   * Verifies a PromotionUpdateRequest message.
   * @param message Plain object to verify
   * @returns `null` if valid, otherwise the reason why it is not
   */
  public static verify(message: { [k: string]: any }): string | null;

  /**
   * Creates a PromotionUpdateRequest message from a plain object. Also converts values to their respective internal types.
   * @param object Plain object
   * @returns PromotionUpdateRequest
   */
  public static fromObject(object: {
    [k: string]: any;
  }): PromotionUpdateRequest;

  /**
   * Creates a plain object from a PromotionUpdateRequest message. Also converts values to other types if specified.
   * @param message PromotionUpdateRequest
   * @param [options] Conversion options
   * @returns Plain object
   */
  public static toObject(
    message: PromotionUpdateRequest,
    options?: $protobuf.IConversionOptions
  ): { [k: string]: any };

  /**
   * Converts this PromotionUpdateRequest to JSON.
   * @returns JSON object
   */
  public toJSON(): { [k: string]: any };
}

/** Properties of a GetCreditCardResponse. */
export interface IGetCreditCardResponse {
  /** GetCreditCardResponse cards */
  cards?: ICreditCard[] | null;
}

/** Represents a GetCreditCardResponse. */
export class GetCreditCardResponse implements IGetCreditCardResponse {
  /**
   * Constructs a new GetCreditCardResponse.
   * @param [properties] Properties to set
   */
  constructor(properties?: IGetCreditCardResponse);

  /** GetCreditCardResponse cards. */
  public cards: ICreditCard[];

  /**
   * Creates a new GetCreditCardResponse instance using the specified properties.
   * @param [properties] Properties to set
   * @returns GetCreditCardResponse instance
   */
  public static create(
    properties?: IGetCreditCardResponse
  ): GetCreditCardResponse;

  /**
   * Encodes the specified GetCreditCardResponse message. Does not implicitly {@link GetCreditCardResponse.verify|verify} messages.
   * @param message GetCreditCardResponse message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encode(
    message: IGetCreditCardResponse,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Encodes the specified GetCreditCardResponse message, length delimited. Does not implicitly {@link GetCreditCardResponse.verify|verify} messages.
   * @param message GetCreditCardResponse message or plain object to encode
   * @param [writer] Writer to encode to
   * @returns Writer
   */
  public static encodeDelimited(
    message: IGetCreditCardResponse,
    writer?: $protobuf.Writer
  ): $protobuf.Writer;

  /**
   * Decodes a GetCreditCardResponse message from the specified reader or buffer.
   * @param reader Reader or buffer to decode from
   * @param [length] Message length if known beforehand
   * @returns GetCreditCardResponse
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decode(
    reader: $protobuf.Reader | Uint8Array,
    length?: number
  ): GetCreditCardResponse;

  /**
   * Decodes a GetCreditCardResponse message from the specified reader or buffer, length delimited.
   * @param reader Reader or buffer to decode from
   * @returns GetCreditCardResponse
   * @throws {Error} If the payload is not a reader or valid buffer
   * @throws {$protobuf.util.ProtocolError} If required fields are missing
   */
  public static decodeDelimited(
    reader: $protobuf.Reader | Uint8Array
  ): GetCreditCardResponse;

  /**
   * Verifies a GetCreditCardResponse message.
   * @param message Plain object to verify
   * @returns `null` if valid, otherwise the reason why it is not
   */
  public static verify(message: { [k: string]: any }): string | null;

  /**
   * Creates a GetCreditCardResponse message from a plain object. Also converts values to their respective internal types.
   * @param object Plain object
   * @returns GetCreditCardResponse
   */
  public static fromObject(object: { [k: string]: any }): GetCreditCardResponse;

  /**
   * Creates a plain object from a GetCreditCardResponse message. Also converts values to other types if specified.
   * @param message GetCreditCardResponse
   * @param [options] Conversion options
   * @returns Plain object
   */
  public static toObject(
    message: GetCreditCardResponse,
    options?: $protobuf.IConversionOptions
  ): { [k: string]: any };

  /**
   * Converts this GetCreditCardResponse to JSON.
   * @returns JSON object
   */
  public toJSON(): { [k: string]: any };
}
