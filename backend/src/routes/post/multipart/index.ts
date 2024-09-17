import { Static, Type } from "@sinclair/typebox";
import { FastifyPluginAsync } from "fastify";
import { FastifyInstance } from "fastify/types/instance.js";
import { join } from "path";
import { writeFileSync } from "fs";

const FormSchema = Type.Object(
  {
    nombre: Type.String(),
    email: Type.String({ format: "email" }),
    foto: Type.Object({}),
  },
  { additionalProperties: false }
);

type Formulario = Static<typeof FormSchema>;

const example: FastifyPluginAsync = async (
  fastify: FastifyInstance,
  opts
): Promise<void> => {
  fastify.post("/", {
    schema: {
      consumes: ["multipart/form-data"],
      body: FormSchema,
    },
    handler: async function (request, reply) {
      const body = request.body as Formulario;
      console.log({ body });
      const fileBuffer = (body.foto as Buffer).toString();
      const filename = join(process.cwd(), "public", "archivo");
      writeFileSync(filename, fileBuffer);
      return body;
    },
  });
};

export default example;
