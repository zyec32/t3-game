import { z } from "zod";

import {
  createTRPCRouter,
  protectedProcedure,
  publicProcedure,
} from "@/server/api/trpc";

export const cardRouter = createTRPCRouter({
  create: protectedProcedure
    .input(z.object({ 
      name: z.string(),
      backgroundColor: z.string(),
      pattern: z.string(),
      patternColor: z.string(),
      secondaryColor: z.string(),
      tertiaryColor: z.string(),
      image: z.optional(z.string()),
     }))
    .mutation(async ({ ctx, input }) => {

      const newCard = await ctx.db.card.create({
        data: input
      })

      return newCard
    }),
});
