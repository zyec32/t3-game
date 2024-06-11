import { z } from "zod";

import {
  createTRPCRouter,
  protectedProcedure,
  publicProcedure,
} from "@/server/api/trpc";

export const gameRouter = createTRPCRouter({
  create: protectedProcedure
    .input(z.object({ playerCount: z.number().min(3).max(6) }))
    .mutation(async ({ ctx, input }) => {
      const newGame = await ctx.db.game.create({
        data: {
          playerCount: input.playerCount
        }
      })

      
      // simulate a slow db call
      // await new Promise((resolve) => setTimeout(resolve, 1000));



      // return ctx.db.post.create({
      //   data: {
      //     name: input.name,
      //     createdBy: { connect: { id: ctx.session.user.id } },
      //   },
      // });
    }),
});
