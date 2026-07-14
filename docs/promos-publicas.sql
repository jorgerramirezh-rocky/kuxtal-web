-- =====================================================================
-- Vista promos_publicas — promos abiertas al público para kuxtal-web
-- Lote F (13-jul-2026). NO APLICADA: requiere OK de George por Telegram.
-- Aplicar en el proyecto Supabase de Kuxtal (tevzfdiumfekvapamovw).
-- =====================================================================
-- security_invoker = off: la vista corre como su dueño (postgres) y NO
-- hereda el RLS de ofertas; anon solo ve estas 9 columnas de las promos
-- activas marcadas tipo_objetivo='publico'. La tabla ofertas sigue
-- cerrada para anon (sin GRANT directo).

create or replace view public.promos_publicas
with (security_invoker = off) as
select id, emoji, titulo, descripcion, descuento, link, ubicacion, foto, vigencia_hasta
from public.ofertas
where activa and tipo_objetivo = 'publico';

grant select on public.promos_publicas to anon;

-- Nota: hoy (13-jul-2026) ninguna oferta tiene tipo_objetivo='publico'
-- (valores vivos: todos, VIP, Gold, Exclusivo). La vista arranca vacía y
-- la sección #promos de la web queda oculta hasta que el CRM publique
-- una promo con audiencia 'publico'.
