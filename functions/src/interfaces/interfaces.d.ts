import * as $protobuf from "protobufjs";
/** Properties of a ProtoCreditCard. */
export interface IProtoCreditCard {

    /** ProtoCreditCard id */
    id?: (string|null);

    /** ProtoCreditCard displayName */
    displayName?: (string|null);

    /** ProtoCreditCard promotions */
    promotions?: (IProtoPromotion[]|null);
}

/** Represents a ProtoCreditCard. */
export class ProtoCreditCard implements IProtoCreditCard {

    /**
     * Constructs a new ProtoCreditCard.
     * @param [properties] Properties to set
     */
    constructor(properties?: IProtoCreditCard);

    /** ProtoCreditCard id. */
    public id: string;

    /** ProtoCreditCard displayName. */
    public displayName: string;

    /** ProtoCreditCard promotions. */
    public promotions: IProtoPromotion[];

    /**
     * Creates a new ProtoCreditCard instance using the specified properties.
     * @param [properties] Properties to set
     * @returns ProtoCreditCard instance
     */
    public static create(properties?: IProtoCreditCard): ProtoCreditCard;

    /**
     * Encodes the specified ProtoCreditCard message. Does not implicitly {@link ProtoCreditCard.verify|verify} messages.
     * @param message ProtoCreditCard message or plain object to encode
     * @param [writer] Writer to encode to
     * @returns Writer
     */
    public static encode(message: IProtoCreditCard, writer?: $protobuf.Writer): $protobuf.Writer;

    /**
     * Encodes the specified ProtoCreditCard message, length delimited. Does not implicitly {@link ProtoCreditCard.verify|verify} messages.
     * @param message ProtoCreditCard message or plain object to encode
     * @param [writer] Writer to encode to
     * @returns Writer
     */
    public static encodeDelimited(message: IProtoCreditCard, writer?: $protobuf.Writer): $protobuf.Writer;

    /**
     * Decodes a ProtoCreditCard message from the specified reader or buffer.
     * @param reader Reader or buffer to decode from
     * @param [length] Message length if known beforehand
     * @returns ProtoCreditCard
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): ProtoCreditCard;

    /**
     * Decodes a ProtoCreditCard message from the specified reader or buffer, length delimited.
     * @param reader Reader or buffer to decode from
     * @returns ProtoCreditCard
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): ProtoCreditCard;

    /**
     * Verifies a ProtoCreditCard message.
     * @param message Plain object to verify
     * @returns `null` if valid, otherwise the reason why it is not
     */
    public static verify(message: { [k: string]: any }): (string|null);

    /**
     * Creates a ProtoCreditCard message from a plain object. Also converts values to their respective internal types.
     * @param object Plain object
     * @returns ProtoCreditCard
     */
    public static fromObject(object: { [k: string]: any }): ProtoCreditCard;

    /**
     * Creates a plain object from a ProtoCreditCard message. Also converts values to other types if specified.
     * @param message ProtoCreditCard
     * @param [options] Conversion options
     * @returns Plain object
     */
    public static toObject(message: ProtoCreditCard, options?: $protobuf.IConversionOptions): { [k: string]: any };

    /**
     * Converts this ProtoCreditCard to JSON.
     * @returns JSON object
     */
    public toJSON(): { [k: string]: any };
}

/** Properties of a ProtoPromotion. */
export interface IProtoPromotion {

    /** ProtoPromotion id */
    id?: (string|null);

    /** ProtoPromotion displayName */
    displayName?: (string|null);

    /** ProtoPromotion category */
    category?: (IProtoShoppingCategory|null);
}

/** Represents a ProtoPromotion. */
export class ProtoPromotion implements IProtoPromotion {

    /**
     * Constructs a new ProtoPromotion.
     * @param [properties] Properties to set
     */
    constructor(properties?: IProtoPromotion);

    /** ProtoPromotion id. */
    public id: string;

    /** ProtoPromotion displayName. */
    public displayName: string;

    /** ProtoPromotion category. */
    public category?: (IProtoShoppingCategory|null);

    /**
     * Creates a new ProtoPromotion instance using the specified properties.
     * @param [properties] Properties to set
     * @returns ProtoPromotion instance
     */
    public static create(properties?: IProtoPromotion): ProtoPromotion;

    /**
     * Encodes the specified ProtoPromotion message. Does not implicitly {@link ProtoPromotion.verify|verify} messages.
     * @param message ProtoPromotion message or plain object to encode
     * @param [writer] Writer to encode to
     * @returns Writer
     */
    public static encode(message: IProtoPromotion, writer?: $protobuf.Writer): $protobuf.Writer;

    /**
     * Encodes the specified ProtoPromotion message, length delimited. Does not implicitly {@link ProtoPromotion.verify|verify} messages.
     * @param message ProtoPromotion message or plain object to encode
     * @param [writer] Writer to encode to
     * @returns Writer
     */
    public static encodeDelimited(message: IProtoPromotion, writer?: $protobuf.Writer): $protobuf.Writer;

    /**
     * Decodes a ProtoPromotion message from the specified reader or buffer.
     * @param reader Reader or buffer to decode from
     * @param [length] Message length if known beforehand
     * @returns ProtoPromotion
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): ProtoPromotion;

    /**
     * Decodes a ProtoPromotion message from the specified reader or buffer, length delimited.
     * @param reader Reader or buffer to decode from
     * @returns ProtoPromotion
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): ProtoPromotion;

    /**
     * Verifies a ProtoPromotion message.
     * @param message Plain object to verify
     * @returns `null` if valid, otherwise the reason why it is not
     */
    public static verify(message: { [k: string]: any }): (string|null);

    /**
     * Creates a ProtoPromotion message from a plain object. Also converts values to their respective internal types.
     * @param object Plain object
     * @returns ProtoPromotion
     */
    public static fromObject(object: { [k: string]: any }): ProtoPromotion;

    /**
     * Creates a plain object from a ProtoPromotion message. Also converts values to other types if specified.
     * @param message ProtoPromotion
     * @param [options] Conversion options
     * @returns Plain object
     */
    public static toObject(message: ProtoPromotion, options?: $protobuf.IConversionOptions): { [k: string]: any };

    /**
     * Converts this ProtoPromotion to JSON.
     * @returns JSON object
     */
    public toJSON(): { [k: string]: any };
}

/** Properties of a ProtoShoppingCategory. */
export interface IProtoShoppingCategory {

    /** ProtoShoppingCategory id */
    id?: (string|null);

    /** ProtoShoppingCategory displayName */
    displayName?: (string|null);
}

/** Represents a ProtoShoppingCategory. */
export class ProtoShoppingCategory implements IProtoShoppingCategory {

    /**
     * Constructs a new ProtoShoppingCategory.
     * @param [properties] Properties to set
     */
    constructor(properties?: IProtoShoppingCategory);

    /** ProtoShoppingCategory id. */
    public id: string;

    /** ProtoShoppingCategory displayName. */
    public displayName: string;

    /**
     * Creates a new ProtoShoppingCategory instance using the specified properties.
     * @param [properties] Properties to set
     * @returns ProtoShoppingCategory instance
     */
    public static create(properties?: IProtoShoppingCategory): ProtoShoppingCategory;

    /**
     * Encodes the specified ProtoShoppingCategory message. Does not implicitly {@link ProtoShoppingCategory.verify|verify} messages.
     * @param message ProtoShoppingCategory message or plain object to encode
     * @param [writer] Writer to encode to
     * @returns Writer
     */
    public static encode(message: IProtoShoppingCategory, writer?: $protobuf.Writer): $protobuf.Writer;

    /**
     * Encodes the specified ProtoShoppingCategory message, length delimited. Does not implicitly {@link ProtoShoppingCategory.verify|verify} messages.
     * @param message ProtoShoppingCategory message or plain object to encode
     * @param [writer] Writer to encode to
     * @returns Writer
     */
    public static encodeDelimited(message: IProtoShoppingCategory, writer?: $protobuf.Writer): $protobuf.Writer;

    /**
     * Decodes a ProtoShoppingCategory message from the specified reader or buffer.
     * @param reader Reader or buffer to decode from
     * @param [length] Message length if known beforehand
     * @returns ProtoShoppingCategory
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    public static decode(reader: ($protobuf.Reader|Uint8Array), length?: number): ProtoShoppingCategory;

    /**
     * Decodes a ProtoShoppingCategory message from the specified reader or buffer, length delimited.
     * @param reader Reader or buffer to decode from
     * @returns ProtoShoppingCategory
     * @throws {Error} If the payload is not a reader or valid buffer
     * @throws {$protobuf.util.ProtocolError} If required fields are missing
     */
    public static decodeDelimited(reader: ($protobuf.Reader|Uint8Array)): ProtoShoppingCategory;

    /**
     * Verifies a ProtoShoppingCategory message.
     * @param message Plain object to verify
     * @returns `null` if valid, otherwise the reason why it is not
     */
    public static verify(message: { [k: string]: any }): (string|null);

    /**
     * Creates a ProtoShoppingCategory message from a plain object. Also converts values to their respective internal types.
     * @param object Plain object
     * @returns ProtoShoppingCategory
     */
    public static fromObject(object: { [k: string]: any }): ProtoShoppingCategory;

    /**
     * Creates a plain object from a ProtoShoppingCategory message. Also converts values to other types if specified.
     * @param message ProtoShoppingCategory
     * @param [options] Conversion options
     * @returns Plain object
     */
    public static toObject(message: ProtoShoppingCategory, options?: $protobuf.IConversionOptions): { [k: string]: any };

    /**
     * Converts this ProtoShoppingCategory to JSON.
     * @returns JSON object
     */
    public toJSON(): { [k: string]: any };
}
